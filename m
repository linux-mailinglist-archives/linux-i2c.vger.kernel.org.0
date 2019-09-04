Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 272AEA81BF
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2019 14:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbfIDL7S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Sep 2019 07:59:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:39500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725938AbfIDL7S (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 4 Sep 2019 07:59:18 -0400
Received: from localhost (unknown [122.182.201.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5E26722CF5;
        Wed,  4 Sep 2019 11:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567598357;
        bh=QOB+pnpJzvM3T17WHP6bSNkNARFO49kKixC1PCOUZsM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aOlfHDSGCDjFeO2R0XS7K6sD4Lgld5REbGaRR3Qia3o5yuRAt/i0/X9owavTvrpO8
         ScrJCDtPQJM+KraQIysQVQWs7fTg5FLoD8fIathUzBvL58Y07IwwuO7RoithpqZvdC
         VmY5Psyz9wHu1jd8h41snskHyvO731eV6EdFByvs=
Date:   Wed, 4 Sep 2019 17:28:08 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, agross@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: soc: qcom: Provide option to select
 FIFO mode
Message-ID: <20190904115808.GX2672@vkoul-mobl>
References: <20190904113613.14997-1-lee.jones@linaro.org>
 <20190904113613.14997-2-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904113613.14997-2-lee.jones@linaro.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 04-09-19, 12:36, Lee Jones wrote:
> Used when DMA is not available or the best option.

Ah binding is the second patch, I would assume think that this should be
first patch :)

Nevertheless looks good to me.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
> index dab7ca9f250c..b0e71c07e604 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
> @@ -40,6 +40,7 @@ Required properties:
>  Optional property:
>  - clock-frequency:	Desired I2C bus clock frequency in Hz.
>  			When missing default to 100000Hz.
> +- qcom,geni-se-fifo:	Selects FIFO processing - as opposed to DMA.
>  
>  Child nodes should conform to I2C bus binding as described in i2c.txt.
>  
> -- 
> 2.17.1

-- 
~Vinod
