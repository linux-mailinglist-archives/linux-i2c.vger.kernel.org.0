Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3A88390DB0
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 03:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232759AbhEZBDp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 21:03:45 -0400
Received: from ozlabs.org ([203.11.71.1]:57237 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230499AbhEZBDo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 May 2021 21:03:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FqXjH4nDhz9s1l;
        Wed, 26 May 2021 11:02:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1621990932;
        bh=7YFaEXfPr9zaWFglhtnONuAD5PnCnM4K1fEPjwflXkk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=oHVrEdNnGr2oj9KRqvebzUCeS+mmscnS/EH66JqawKZP922vwiSxH10iV5/+2mhQH
         OLbb8bi7+AuooHvmyQiAS2NrrzFTIx56EigazAl/Ja4jPyvlw+Nr0rA53ukrCBra2G
         V8roIGSpzVK96pg1XYHKa+cr6s1zLDHC/BYd6ABr3rEdh9ngdnQzeMWsHQK8uILXbL
         ADPab14Rqui7tx6TE7Zw6D19DHPkW+faFNLtIDVUQKnh+Rul/TGO72b2HR3oHIBwqf
         dIW0KHamcspLPKd/T09N2KT/BWIly+XS9lsV5k+KK60GyxtiLmiOcyjbmz6rcFPFbK
         ecugbPRrEnlMA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, andy.shevchenko@gmail.com,
        robh+dt@kernel.org
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v3 2/4] powerpc/fsl: set fsl,i2c-erratum-a004447 flag
 for P2041 i2c controllers
In-Reply-To: <20210511212052.27242-3-chris.packham@alliedtelesis.co.nz>
References: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
 <20210511212052.27242-3-chris.packham@alliedtelesis.co.nz>
Date:   Wed, 26 May 2021 11:02:05 +1000
Message-ID: <874keqi9yq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Chris Packham <chris.packham@alliedtelesis.co.nz> writes:
> The i2c controllers on the P2040/P2041 have an erratum where the
> documented scheme for i2c bus recovery will not work (A-004447). A
> different mechanism is needed which is documented in the P2040 Chip
> Errata Rev Q (latest available at the time of writing).
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  arch/powerpc/boot/dts/fsl/p2041si-post.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> diff --git a/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi b/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
> index 872e4485dc3f..ddc018d42252 100644
> --- a/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/p2041si-post.dtsi
> @@ -371,7 +371,23 @@ sdhc@114000 {
>  	};
>  
>  /include/ "qoriq-i2c-0.dtsi"
> +	i2c@118000 {
> +		fsl,i2c-erratum-a004447;
> +	};
> +
> +	i2c@118100 {
> +		fsl,i2c-erratum-a004447;
> +	};
> +
>  /include/ "qoriq-i2c-1.dtsi"
> +	i2c@119000 {
> +		fsl,i2c-erratum-a004447;
> +	};
> +
> +	i2c@119100 {
> +		fsl,i2c-erratum-a004447;
> +	};
> +
>  /include/ "qoriq-duart-0.dtsi"
>  /include/ "qoriq-duart-1.dtsi"
>  /include/ "qoriq-gpio-0.dtsi"
> -- 
> 2.31.1
