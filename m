Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67E34577A7D
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jul 2022 07:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233284AbiGRFhK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jul 2022 01:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiGRFhJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jul 2022 01:37:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3973313D61;
        Sun, 17 Jul 2022 22:37:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E96B0B80F52;
        Mon, 18 Jul 2022 05:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141D2C341C0;
        Mon, 18 Jul 2022 05:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658122626;
        bh=GhUBjzax61RwlDZhvcCJN6LFCaHH3RAVVObCDwyAiB0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LuIudfUAUtHHzPlKUyKuu3F4rjhtQzXjcMUzWdf7FYS5t/pUCP97k2SjT9is7SJYT
         4fxqu1pbleU0xIoLQo8dKlyNeO3pygDZEkvS2+l7J59UyXb77y+lIC3hM+cO/QzqEZ
         NI9N2yclswRPueYm7eNKbj6Art+0LYWK01MOTHbWFTFzlu8+TbXtEbwJvUrbGtf1bN
         dMjDq4uJ92pki5QLxjLfeiC63cYugWZDX8OKgbryk7JArhIMQnJla4Z7BfdPvyBx/I
         ZuMkxui0HZKMgge/pyNjMIyIzeHtbyIQFk+h+DwkDn8QRqsqXzhYW6ZxZXLYaqiZp8
         3PzyXfqKWySkA==
Date:   Mon, 18 Jul 2022 11:07:02 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Wolfram Sang <wsa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: qcom-geni: Silence NACK and GENI_TIMEOUT
Message-ID: <YtTxfizAc8EHoXNA@matsya>
References: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
 <20220717035027.2135106-4-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220717035027.2135106-4-bjorn.andersson@linaro.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16-07-22, 20:50, Bjorn Andersson wrote:
> Turn NACK and GENI_TIMEOUT into debug prints to silence the kernel log
> when running things such as i2cdetect to scan the bus.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index e212e7ae7ad2..6ac179a373ff 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -208,6 +208,10 @@ static void geni_i2c_err(struct geni_i2c_dev *gi2c, int err)
>  	case GENI_ABORT_DONE:
>  		gi2c->abort_done = true;
>  		break;
> +	case NACK:
> +	case GENI_TIMEOUT:
> +		dev_dbg(gi2c->se.dev, "%s\n", gi2c_log[err].msg);
> +		break;
>  	default:
>  		dev_err(gi2c->se.dev, "%s\n", gi2c_log[err].msg);
>  		geni_i2c_err_misc(gi2c);
> -- 
> 2.35.1

-- 
~Vinod
