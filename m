Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72B8A58C7C9
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Aug 2022 13:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234639AbiHHLqi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Aug 2022 07:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233073AbiHHLqh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Aug 2022 07:46:37 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8677F5FB4
        for <linux-i2c@vger.kernel.org>; Mon,  8 Aug 2022 04:46:36 -0700 (PDT)
Received: from [192.168.1.101] (abxh187.neoplus.adsl.tpnet.pl [83.9.1.187])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 2D60F3F6FC;
        Mon,  8 Aug 2022 13:46:32 +0200 (CEST)
Message-ID: <c9402e30-f410-8c29-2da4-4cbc993de6a5@somainline.org>
Date:   Mon, 8 Aug 2022 13:46:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] i2c: qcom-geni: Fix GPI DMA buffer sync-back
Content-Language: en-US
To:     Robin Reckmann <robin.reckmann@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc:     Robin Reckmann <robin.reckmann@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20220807140455.409417-1-robin.reckmann@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220807140455.409417-1-robin.reckmann@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 7.08.2022 16:04, Robin Reckmann wrote:
> Fix i2c transfers using GPI DMA mode for all message types that do not set
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
> ---
Makes SM8450 Xperia 1 IV boot with the touchscreen but enabled (previously
it would simply crash), but the touchscreen itself does not work yet (not
yet sure if something is still missing on my part wrt hw setup):

[    1.838819] gpi 900000.dma-controller: Error in Transaction
[    1.838944] geni_i2c 990000.i2c: DMA txn failed:3
[    1.839166] geni_i2c 990000.i2c: GPI transfer failed: -5


Still, this is a very nice improvement.

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  drivers/i2c/busses/i2c-qcom-geni.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 6ac402ea58fb..d3541e94794e 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -484,12 +484,12 @@ static void geni_i2c_gpi_unmap(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  {
>  	if (tx_buf) {
>  		dma_unmap_single(gi2c->se.dev->parent, tx_addr, msg->len, DMA_TO_DEVICE);
> -		i2c_put_dma_safe_msg_buf(tx_buf, msg, false);
> +		i2c_put_dma_safe_msg_buf(tx_buf, msg, !gi2c->err);
>  	}
>  
>  	if (rx_buf) {
>  		dma_unmap_single(gi2c->se.dev->parent, rx_addr, msg->len, DMA_FROM_DEVICE);
> -		i2c_put_dma_safe_msg_buf(rx_buf, msg, false);
> +		i2c_put_dma_safe_msg_buf(rx_buf, msg, !gi2c->err);
>  	}
>  }
>  
> @@ -553,6 +553,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	desc->callback_param = gi2c;
>  
>  	dmaengine_submit(desc);
> +	*buf = dma_buf;
>  	*dma_addr_p = addr;
>  
>  	return 0;
