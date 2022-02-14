Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41D434B4FFA
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Feb 2022 13:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbiBNMXL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Feb 2022 07:23:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbiBNMXK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Feb 2022 07:23:10 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C3D2CDB
        for <linux-i2c@vger.kernel.org>; Mon, 14 Feb 2022 04:23:00 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id c10so3317488pfv.8
        for <linux-i2c@vger.kernel.org>; Mon, 14 Feb 2022 04:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/fKGi+aZQ8kJT7QB416GU61uDV70ufNvidZa81KvKic=;
        b=vFo0Obd+cFUSjtmLDB9peVEXAhk0DLQBiiq4f52M15K/JE4k2KaeXTU4+2erbAs+M3
         hQ+7O84f/waEaWBZc1z0oIFctBC3wtpjLUu/5Bz0N8cG6eWmFGx27Rb5v6oSDU5JC4lJ
         qIryjPbQ90X4+yosO/XNkxGTh/NYC9DycZnWOl8PwsaIXG6gzF9l0QhE3FEMPtQ2DTa+
         hQg1YpY+V6N5N56ivvxl2AUyBvLZ1fd2VzzcrMTYW+b070MtabsWPLxLE5jFTjzhHPUk
         2QvKMqmIUXYknu1ZQzCRTWin6t6t+zSnZEOhrcjYEqKn/VObB3MJmPLjPrhV9hrJz5JB
         SuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/fKGi+aZQ8kJT7QB416GU61uDV70ufNvidZa81KvKic=;
        b=x2O4bdUHvcaCwRWYRzGGTHM/VlPpMYXctLvXtDL9rg20+dZD63jN2dtD0HXMDFJ98M
         n8B3PlZ5Jk/1xcoZMEFPD8IhVrr7cN0RcTKMUHYQvGxv03sRhGKK+VBSC/e9H/6JkWRx
         o3nD3SJC/EG7o96KESb19w/NBRxNtkR+FsJzKudm18ac0hIuzF5LD2uwX336BJS7IKVg
         i6YD5/Q01r3XN2OtletJwoKm2LGU/FMEv4um8mby4wrvUIFGUsdO1yaXovfyp8tneod4
         WTlTC1xMrJ8ARB0Sp9A+LP4ybYtzVYcVNjxPVqKjTBzuh+OONzL66ALFk2Qqor58xaqt
         cY8A==
X-Gm-Message-State: AOAM531SYZpoa9St+Y34VzvFtZFyxnQaDCF+6cCKP+pkVs8ZyrJzbJgx
        JbiJb4gjXAn8vmzaIe5h3HcPTtT7j2tW6iKGdTcveXCRAB4=
X-Google-Smtp-Source: ABdhPJxfIQjis1IV1rr41YtGuFAtEtzkv9eQMAqKqqEbZ7g0+Ak8gVF6z76sM07Thkhv3lDma6t3q6PxxQlOdEQ9t7k=
X-Received: by 2002:a62:3605:: with SMTP id d5mr14076862pfa.68.1644841379524;
 Mon, 14 Feb 2022 04:22:59 -0800 (PST)
MIME-Version: 1.0
References: <20220214090020.89984-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20220214090020.89984-1-yang.lee@linux.alibaba.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Mon, 14 Feb 2022 13:22:48 +0100
Message-ID: <CAOtMz3O5ygQQDU_WNNdJGW4+6Vi02zDebhWLic9Sm7UGSpFyVQ@mail.gmail.com>
Subject: Re: [PATCH -next v2] i2c: designware: remove unneeded semicolon
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abaci Robot <abaci@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pon., 14 lut 2022 o 10:00 Yang Li <yang.lee@linux.alibaba.com> napisa=C5=82=
(a):
>
> Eliminate the following coccicheck warning:

nit: warnings

> ./drivers/i2c/busses/i2c-designware-amdpsp.c:172:2-3: Unneeded semicolon
> ./drivers/i2c/busses/i2c-designware-amdpsp.c:245:2-3: Unneeded semicolon
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Beside a nit above:
Reviewed-by: Jan Dabros <jsd@semihalf.com>

Best Regards,
Jan

> ---
>
> --Changes in v2:
>   According to Jan's suggestion
>   Fix the same problem in check_i2c_req_sts() function.
>
>  drivers/i2c/busses/i2c-designware-amdpsp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/bus=
ses/i2c-designware-amdpsp.c
> index 752e0024db03..9d37becbd846 100644
> --- a/drivers/i2c/busses/i2c-designware-amdpsp.c
> +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
> @@ -172,7 +172,7 @@ static int check_i2c_req_sts(struct psp_i2c_req *req)
>         case PSP_I2C_REQ_STS_INV_PARAM:
>         default:
>                 return -EIO;
> -       };
> +       }
>  }
>
>  static int psp_send_check_i2c_req(struct psp_i2c_req *req)
> @@ -245,7 +245,7 @@ static int psp_acquire_i2c_bus(void)
>         if (psp_i2c_access_count) {
>                 psp_i2c_access_count++;
>                 goto cleanup;
> -       };
> +       }
>
>         status =3D psp_send_i2c_req(PSP_I2C_REQ_ACQUIRE);
>         if (status) {
> --
> 2.20.1.7.g153144c
>
