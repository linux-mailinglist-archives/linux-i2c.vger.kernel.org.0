Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77ECD390DB3
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 03:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232670AbhEZBEB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 21:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbhEZBEB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 May 2021 21:04:01 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74EB4C061574;
        Tue, 25 May 2021 18:02:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FqXjZ6tj2z9s1l;
        Wed, 26 May 2021 11:02:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1621990947;
        bh=ovmd0QF/+rpAnQrJvBUm7otUcw+qV5Ofv5ggDfLR6Xc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=p6bYg521w6h6ZLZ4HKv4fMMUYE1um6gMHa4CCo11P+CNv8k3t4VY708RdlLJKQ7BN
         FfeoldeuFU+NKz8DfiDtrZACNYxwH/Fphp2P4M3Dv0SEsF2FBt5yoVuhO5NyIyCeLb
         zr0OEXpyVuZE7e0N072prtqci6KDWDLoPHU/ny4/BMheg+eBHayHSgyH7FaOEgrpQZ
         xSRSWkPHHjdY8TYncZj5Uk/w/0PGTiKUWoGsStN4qqqmAYVnT+7duEx84qjd+3V24V
         UGbofM4eKqRN8smR3tP/hNAtxcDKQLoD0BpfkkWMD1yn+M+89Kenc4jNSWwIWWg1q+
         eFESgryfTEU8Q==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, andy.shevchenko@gmail.com,
        robh+dt@kernel.org
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v3 3/4] powerpc/fsl: set fsl,i2c-erratum-a004447 flag
 for P1010 i2c controllers
In-Reply-To: <20210511212052.27242-4-chris.packham@alliedtelesis.co.nz>
References: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
 <20210511212052.27242-4-chris.packham@alliedtelesis.co.nz>
Date:   Wed, 26 May 2021 11:02:26 +1000
Message-ID: <871r9ui9y5.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Chris Packham <chris.packham@alliedtelesis.co.nz> writes:
> The i2c controllers on the P1010 have an erratum where the documented
> scheme for i2c bus recovery will not work (A-004447). A different
> mechanism is needed which is documented in the P1010 Chip Errata Rev L.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>
> Notes:
>     Changes in v3:
>     - New
>
>  arch/powerpc/boot/dts/fsl/p1010si-post.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> diff --git a/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi b/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
> index c2717f31925a..ccda0a91abf0 100644
> --- a/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
> @@ -122,7 +122,15 @@ memory-controller@2000 {
>  	};
>  
>  /include/ "pq3-i2c-0.dtsi"
> +	i2c@3000 {
> +		fsl,i2c-erratum-a004447;
> +	};
> +
>  /include/ "pq3-i2c-1.dtsi"
> +	i2c@3100 {
> +		fsl,i2c-erratum-a004447;
> +	};
> +
>  /include/ "pq3-duart-0.dtsi"
>  /include/ "pq3-espi-0.dtsi"
>  	spi0: spi@7000 {
> -- 
> 2.31.1
