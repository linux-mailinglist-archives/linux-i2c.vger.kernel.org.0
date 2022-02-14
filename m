Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE084B4343
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Feb 2022 09:08:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241563AbiBNIIU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Feb 2022 03:08:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240249AbiBNIIT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Feb 2022 03:08:19 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D0DD5F8E6
        for <linux-i2c@vger.kernel.org>; Mon, 14 Feb 2022 00:08:11 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id i21so26439841pfd.13
        for <linux-i2c@vger.kernel.org>; Mon, 14 Feb 2022 00:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=56W7FW3d2YQP4s0rwZDFp5xphOL7Nyc7P1QxkUB2iqM=;
        b=y9XgUKB1iGK/QkLywtzU1ltCMoxyUeURdvdRqdC+54fM33esphESWPShK5Y6zb6eSY
         tn/cwGuMWZJFKiAM3yfVuL3yERpDUgpw2Rg5/EzuKT2GrkVikgwFETOhK2taBwzghcUJ
         iNXWN2zGDvTM1CV7k56WTm7pMJtuN0Re4i58/tcUYb7xFj4P3swqUounq06DAG6ttqGN
         QQsdxvtEyoptINBAa8/mFeEUkxQZeyMLP7733ktyHDgh4tVqPSFIjS/2pJOBQVQ/Bv5Q
         eiUkygVs0uJCiZm+YKm7A6ylBkkGt5CpLF5k3ke+JCg0W47yqgnVyJ9SfYmeoAm5XTDP
         GExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=56W7FW3d2YQP4s0rwZDFp5xphOL7Nyc7P1QxkUB2iqM=;
        b=q2oJHEh3kPvUlXBnoMCmUp2PP1ZzzZzlc5FWNCdcxS01L1S4qVCeRTTC7DxV3yIEBf
         oUy4MKvI1oJ3VNQCEjDMozrZALrd5ZlmySdij4Ev3k7kvmkD1lfmgf0dTghktBRdP4OH
         uLfMfbC6GkgBw5FhrPjwiqd27utHswqPAvdPytmqdkq7aiQb+3nyEGKDY93Kizrh/vkj
         75n5sw83Poo0jETjEzrPfsVx3czOXY47K60wbFmREoIAAbG9n64TUdCG8ZnmOej5zT+x
         1SKkFJCh3iUz6Qz0EgDtJKhBdBUM9pBktzLvZDFUkHHW/cyTwrCrWzn0i86WnNaZSlKN
         /gtA==
X-Gm-Message-State: AOAM531UhVq1FB+HaYsMkiuKmieB5dOx9ZWGyDOpFCvqi35/Qf342/9w
        H+yQZZD1zrbWmO2uN4vBqiyLr7aUfnAUExAnrQIFKA==
X-Google-Smtp-Source: ABdhPJy4Z+JLlYYMU4cCyJ5vx3/ZKTD9+2/JwTdyd1UIFlXHKEYvwCMUeMCAAcz2Zmpq0a6uBSE/Dpey0PKRNniOhRU=
X-Received: by 2002:aa7:85c3:: with SMTP id z3mr13104120pfn.70.1644826090449;
 Mon, 14 Feb 2022 00:08:10 -0800 (PST)
MIME-Version: 1.0
References: <20220214010348.129251-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20220214010348.129251-1-yang.lee@linux.alibaba.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Mon, 14 Feb 2022 09:07:59 +0100
Message-ID: <CAOtMz3OqPCF6ykBAaO-gYTkDpjcaRnq5pDietXYmY6_eASj95Q@mail.gmail.com>
Subject: Re: [PATCH -next] i2c: designware: remove unneeded semicolon
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

pon., 14 lut 2022 o 02:03 Yang Li <yang.lee@linux.alibaba.com> napisa=C5=82=
(a):
>
> Eliminate the following coccicheck warning:
> ./drivers/i2c/busses/i2c-designware-amdpsp.c:248:2-3: Unneeded semicolon
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/i2c/busses/i2c-designware-amdpsp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/bus=
ses/i2c-designware-amdpsp.c
> index 752e0024db03..f589d3a1a19e 100644
> --- a/drivers/i2c/busses/i2c-designware-amdpsp.c
> +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
> @@ -245,7 +245,7 @@ static int psp_acquire_i2c_bus(void)
>         if (psp_i2c_access_count) {
>                 psp_i2c_access_count++;
>                 goto cleanup;
> -       };
> +       }

Thanks. While fixing this, please do the same for the 'switch' in
check_i2c_req_sts() function above. Isn't your tool reporting this?

Best Regards,
Jan
