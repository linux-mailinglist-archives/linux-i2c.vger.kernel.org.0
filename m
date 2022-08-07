Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30C6B58BB94
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Aug 2022 17:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233517AbiHGPba (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Aug 2022 11:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233356AbiHGPb3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 7 Aug 2022 11:31:29 -0400
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA15640A;
        Sun,  7 Aug 2022 08:31:25 -0700 (PDT)
Date:   Sun, 07 Aug 2022 15:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1659886279; x=1660145479;
        bh=YHlXS1js2a8lbYFdeBlkI7exi/3zmStUxGjeZdRforw=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
         Feedback-ID:Message-ID;
        b=T52PhAI9tffZwaFkL5rQPfkf5ZKVzDLfVkbq2M+fh2xQLVX89r1mlhPgq9qDexrMk
         zyPoATlrq50HNVfQ4/sSYXpA4Sg0kq0XPpsCmSW5Poo1tSqxc1AK7Eo1Sqbotp1xH9
         o0yDM7gOXq05wwTsiCztwlPifRp3v3EuFSUpTJrQ=
To:     Robin Reckmann <robin.reckmann@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Robin Reckmann <robin.reckmann@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH] i2c: qcom-geni: Fix GPI DMA buffer sync-back
Message-ID: <653e93e7-6bdc-3498-7719-f3a7860dd245@connolly.tech>
In-Reply-To: <20220807140455.409417-1-robin.reckmann@gmail.com>
References: <20220807140455.409417-1-robin.reckmann@gmail.com>
Feedback-ID: 10753939:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 07/08/2022 15:04, Robin Reckmann wrote:
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
Thanks for sending this, it fixes GPI DMA on the PocoPhone F1 and Pixel 3!
>
> Signed-off-by: Robin Reckmann <robin.reckmann@gmail.com>Reviewed-by: Cale=
b Connolly <caleb@connolly.tech>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index 6ac402ea58fb..d3541e94794e 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -484,12 +484,12 @@ static void geni_i2c_gpi_unmap(struct geni_i2c_dev =
*gi2c, struct i2c_msg *msg,
>   {
>   =09if (tx_buf) {
>   =09=09dma_unmap_single(gi2c->se.dev->parent, tx_addr, msg->len, DMA_TO_=
DEVICE);
> -=09=09i2c_put_dma_safe_msg_buf(tx_buf, msg, false);
> +=09=09i2c_put_dma_safe_msg_buf(tx_buf, msg, !gi2c->err);
>   =09}
>
>   =09if (rx_buf) {
>   =09=09dma_unmap_single(gi2c->se.dev->parent, rx_addr, msg->len, DMA_FRO=
M_DEVICE);
> -=09=09i2c_put_dma_safe_msg_buf(rx_buf, msg, false);
> +=09=09i2c_put_dma_safe_msg_buf(rx_buf, msg, !gi2c->err);
>   =09}
>   }
>
> @@ -553,6 +553,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, st=
ruct i2c_msg *msg,
>   =09desc->callback_param =3D gi2c;
>
>   =09dmaengine_submit(desc);
> +=09*buf =3D dma_buf;
>   =09*dma_addr_p =3D addr;
>
>   =09return 0;
> --
> 2.25.1
>

--
Kind Regards,
Caleb

