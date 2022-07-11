#ifndef SLHDR_H
#define SLHDR_H

#ifdef _MSC_VER
#define export_attribute __declspec(dllexport)
#else
#define export_attribute
#endif

#ifdef __cplusplus
extern "C"
{
#endif

export_attribute void
pp_slhdr_no_filter(void* slhdr_context, int16_t** sdr_pic, int16_t** hdr_pic, 
                uint8_t* SEIPayload, int pic_width, int pic_height);

export_attribute void
pp_sdr_to_hdr(void* slhdr_context, int16_t** sdr_pic, int16_t** hdr_pic, 
                uint8_t* SEIPayload, int pic_width, int pic_height);

export_attribute void
pp_init_slhdr_lib(void** pslhdr_context);

export_attribute void
pp_uninit_slhdr_lib(void* slhdr_context);

#ifdef __cplusplus
}
#endif

#endif //SLHDR_H