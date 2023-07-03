Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83280745F2F
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 16:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbjGCOzN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 10:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjGCOzN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 10:55:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ACC610E;
        Mon,  3 Jul 2023 07:55:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 160A460F8F;
        Mon,  3 Jul 2023 14:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B906C433C8;
        Mon,  3 Jul 2023 14:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688396111;
        bh=YCM3/zDzW27xq1LWWr7kRRA3cqdQUNKm0dJzlI83bZ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T8TDGJAToqfT6T+brq5xpRoFRa3rQJHZAWQY463u+y4RNKw92hF0pISOkmAN1YBwl
         mbvtvPUdBU17/uvhHbQwwfFqCiq/skmvFySB3wGopYD0ZVf4KfDLglu90ZM7SMjHeW
         YzkhUwTQxxZgZFeJj7f89KJaVfXhU1NBTNzVWU/lffPOEhr0eLALyjGFLEaUbz+2Ej
         IxPf6bjvyN7U5K8OaOilBHWKXuBpQU7hj1UDihwJxcig689oQzm98bRZYinPDwxNc+
         DNkMseV1vXkvH3m2/pVPrZUSd8qsbRhl3qPXozNL6JVefl/Yla+09LNup7nD7FVND8
         yAy7llnFb0Z7Q==
Date:   Mon, 3 Jul 2023 07:58:55 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 0/5] Add interconnects to QUPs on SM8250
Message-ID: <sd2ultz22evkl4at4aq54qybhcvtchgxcgdwldmn6s4ia66szr@4abuxln7b3bu>
References: <20230703-topic-8250_qup_icc-v1-0-fea39aa07525@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703-topic-8250_qup_icc-v1-0-fea39aa07525@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 03, 2023 at 03:31:09PM +0200, Konrad Dybcio wrote:
> SM8250 (like SM8150 but unlike all other QUP-equipped SoCs) doesn't
> provide a qup-core path. Adjust the bindings and drivers as necessary,
> and then describe the icc paths in the device tree. This makes it possible
> for interconnect sync_state succeed so long as you don't use UFS.
> 

The "qup-core" path is a vote between two nodes on the QUP0 BCM, to
provide a frequency vote on the QUP core(s). Both SM8150 and SM8250 has
this BCM, but as you point out it's not exposed through the interconnect
provider.

I don't know why this is, but I think it would be preferable to amend
the provider.

Regards,
Bjorn

> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Konrad Dybcio (5):
>       dt-bindings: spi: spi-geni-qcom: Allow no qup-core icc path
>       dt-bindings: serial: geni-qcom: Allow no qup-core icc path
>       dt-bindings: i2c: qcom,i2c-geni: Allow no qup-core icc path
>       soc: qcom: geni-se: Allow any combination of icc paths
>       arm64: dts: qcom: sm8250: Add interconnects and power-domains to QUPs
> 
>  .../bindings/i2c/qcom,i2c-geni-qcom.yaml           |  27 ++--
>  .../bindings/serial/qcom,serial-geni-qcom.yaml     |  26 ++--
>  .../bindings/spi/qcom,spi-geni-qcom.yaml           |  15 ++-
>  arch/arm64/boot/dts/qcom/sm8250.dtsi               | 150 +++++++++++++++++++++
>  drivers/soc/qcom/qcom-geni-se.c                    |   9 +-
>  5 files changed, 204 insertions(+), 23 deletions(-)
> ---
> base-commit: 296d53d8f84ce50ffaee7d575487058c8d437335
> change-id: 20230703-topic-8250_qup_icc-61768a34c7ec
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@linaro.org>
> 
