Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2700D58C397
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Aug 2022 09:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234913AbiHHHAH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Aug 2022 03:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbiHHHAF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Aug 2022 03:00:05 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9AADFA4
        for <linux-i2c@vger.kernel.org>; Mon,  8 Aug 2022 00:00:03 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id dc19so14800340ejb.12
        for <linux-i2c@vger.kernel.org>; Mon, 08 Aug 2022 00:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc;
        bh=2/N6mFP+TYpvLhr23ybFH/UP8B6EWzbXHA/jkbBuIoc=;
        b=lkU29Ua428YWYVoXEMmDC0UaKbp+MGrvym2etqoPjNHVD2NL3tW0LF47PkXL04Ez3I
         vvDnB0EtThz40r8LCfeh+Mi4sLOX5jf8l3WCEzdsZk29I34a9O4PwXXIdG1oZTobtiTS
         Pr8yAIQcboCA7RWA0WoPC/lm1iMyf/gbxHMWKW/BfGmB15dsR2/tcpYYVI1egrVLe5QD
         n4sJi1Cd7mLiUIbqcvP7KLtQx9ydpy1/5chSsTH6oupCLjJMhZSlmioLlr6BVSn6QEkW
         RVhYK9yeeUKGculzGgFZU/b7kaWseSpXzQZagr+e3yArPV0ouWvwmyQdyF8oANNnxi7k
         zzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc;
        bh=2/N6mFP+TYpvLhr23ybFH/UP8B6EWzbXHA/jkbBuIoc=;
        b=rtOWkPJnnmbGMATyIddAGPcqsKPnKbnDSveGcZXFFKFzLHr2uGVcs1VzB4aZVGuYI8
         Ac9aeOSOn/DFH1VOLm5Vw01EBmsEBQR2JWqlcArHCCXTibqWwFOmBIveM02/Sza2vU5O
         cwMLY87pgVAsRM1wefoApWmLYg0+DTmtdp1kDVElzL362lj8vKJpJZcCO3/ejHqKTljQ
         XHTfZLuA79ktXAfbSiEPgr5JkQYX35A/mqgqGacV8Mvh5FYU2L7Bc4WgVybyT0S3mPbm
         JOkRK3TunHNaLbpWmxUTEjBjCC/QbvFhEqi4KZFRDOzfIg31PK5xuTIZyS53xHzZqCkK
         88iQ==
X-Gm-Message-State: ACgBeo2mwU5+d8K0QI48SgW170lJzzzL+wzci7LxNfBThrVX5nMb6zaT
        oM2pvPLGObK1LbhE8ABg0nUUYHekV/t02w==
X-Google-Smtp-Source: AA6agR6hGuVY0jLoIpyBwpB68Ep5URWwiz9kxZGjZ1bEwFDjjVx2YCyxBdkT2y7+2dYKFcVRfMWxGg==
X-Received: by 2002:a17:907:2721:b0:731:2aeb:7940 with SMTP id d1-20020a170907272100b007312aeb7940mr6385812ejl.448.1659942001700;
        Mon, 08 Aug 2022 00:00:01 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id zk19-20020a17090733d300b0072aadbd48c7sm4512240ejb.84.2022.08.08.00.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 00:00:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 08 Aug 2022 08:59:59 +0200
Message-Id: <CM0GBVEZHLBT.1V54N4FCEN7V6@otso>
Cc:     "Robin Reckmann" <robin.reckmann@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH] i2c: qcom-geni: Fix GPI DMA buffer sync-back
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Robin Reckmann" <robin.reckmann@googlemail.com>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        "Konrad Dybcio" <konrad.dybcio@somainline.org>,
        "Sumit Semwal" <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailer: aerc 0.11.0
References: <20220807140455.409417-1-robin.reckmann@gmail.com>
In-Reply-To: <20220807140455.409417-1-robin.reckmann@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Robin,

On Sun Aug 7, 2022 at 4:04 PM CEST, Robin Reckmann wrote:
> Fix i2c transfers using GPI DMA mode for all message types that do not se=
t
> the I2C_M_DMA_SAFE flag (e.g. SMBus "read byte").
>
> In this case a bounce buffer is returned by i2c_get_dma_safe_msg_buf(),
> and it has to synced back to the message after the transfer is done.
>
> Add missing assignment of dma buffer in geni_i2c_gpi().
>
> Set xferred in i2c_put_dma_safe_msg_buf() to true in case of no error to
> ensure the sync-back of this dma buffer to the message.
>
> Signed-off-by: Robin Reckmann <robin.reckmann@gmail.com>

This makes I2C with GPI DMA work on sm6350/sm7725 fairphone-fp4!
Thanks for fixing this!

Tested-by: Luca Weiss <luca.weiss@fairphone.com>

Regards
Luca

> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index 6ac402ea58fb..d3541e94794e 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -484,12 +484,12 @@ static void geni_i2c_gpi_unmap(struct geni_i2c_dev =
*gi2c, struct i2c_msg *msg,
>  {
>  	if (tx_buf) {
>  		dma_unmap_single(gi2c->se.dev->parent, tx_addr, msg->len, DMA_TO_DEVIC=
E);
> -		i2c_put_dma_safe_msg_buf(tx_buf, msg, false);
> +		i2c_put_dma_safe_msg_buf(tx_buf, msg, !gi2c->err);
>  	}
> =20
>  	if (rx_buf) {
>  		dma_unmap_single(gi2c->se.dev->parent, rx_addr, msg->len, DMA_FROM_DEV=
ICE);
> -		i2c_put_dma_safe_msg_buf(rx_buf, msg, false);
> +		i2c_put_dma_safe_msg_buf(rx_buf, msg, !gi2c->err);
>  	}
>  }
> =20
> @@ -553,6 +553,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, st=
ruct i2c_msg *msg,
>  	desc->callback_param =3D gi2c;
> =20
>  	dmaengine_submit(desc);
> +	*buf =3D dma_buf;
>  	*dma_addr_p =3D addr;
> =20
>  	return 0;
> --=20
> 2.25.1

