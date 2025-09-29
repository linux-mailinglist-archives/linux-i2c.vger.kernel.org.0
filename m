Return-Path: <linux-i2c+bounces-13272-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 397E7BA7F1B
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Sep 2025 06:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDD9117E7CF
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Sep 2025 04:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451B61B142D;
	Mon, 29 Sep 2025 04:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="S9VRc4MP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665B534BA50;
	Mon, 29 Sep 2025 04:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759120816; cv=none; b=o2SfXX1MeD7yFV/56v6+W6SqSXL3oKEOo/wmRUJoFgug43P9q+t+Jei8T7Om+ChNTLYJH/17V7Z+btxQAV7HoZrJm/Z6NminabS4fc5PJO3UUpBNEqLBo04sot6v8lcUpQ3QevSfgD9NqGejkl03gbvatHXXdllagClN6fLIUPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759120816; c=relaxed/simple;
	bh=uOlE6JF3Wlo/vFJGbhrugJ3aZGyj9ga2nv00JK3gbws=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ANmcROk0+b7fim+97ljd8S0pHxdf9Z97IiEQzcwjaqEQnCAElXxywUisrXrrRJmXLABOm0wJvCZO7DnUCBeaME4HYr2lAffdQwULtVm3Gbbnm/7ZRYwwhrJ9CfNlpnKKsF7chFocUcU7M4dWRUZ3s1MRzkmn60+nCNW595OyUPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=S9VRc4MP; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58T4e58t2105225;
	Sun, 28 Sep 2025 23:40:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759120805;
	bh=7PnRPMQlYyEfPuWVss3mAZp/DtxuUn4FykB5vQK+A5k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=S9VRc4MPQTUnEHvMtmoyr8I2/wq1U14P59ZGfmvIeuEMGmX27Ho5pqFAx+lR1h+1/
	 CkPRNjY8I/GTa9mOqXDePumg6vQWX9GJzcyRk74/PhCB2lB+KmdQq7xGZtEXT/yAwT
	 8/bCNCun5LeKXJwLreL3ftXa8nacaISdr6f1DGSE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58T4e5he1078855
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sun, 28 Sep 2025 23:40:05 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sun, 28
 Sep 2025 23:40:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 28 Sep 2025 23:40:04 -0500
Received: from [172.24.231.164] (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.231.164])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58T4e0mb612567;
	Sun, 28 Sep 2025 23:40:00 -0500
Message-ID: <0784441c-9859-4418-a4a7-85ffe3ecf860@ti.com>
Date: Mon, 29 Sep 2025 10:09:59 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/3] dt-binding: Add register-settings binding
To: Rajesh Gumasta <rgumasta@nvidia.com>, <krzk+dt@kernel.org>,
        <robh@kernel.org>, <conor+dt@kernel.org>, <andi.shyti@kernel.org>,
        <ulf.hansson@linaro.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <kyarlagadda@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <andersson@kernel.org>, <sjg@chromium.org>, <nm@ti.com>
References: <20250725052225.23510-1-rgumasta@nvidia.com>
 <20250725052225.23510-2-rgumasta@nvidia.com>
Content-Language: en-US
From: Chintan Vankar <c-vankar@ti.com>
In-Reply-To: <20250725052225.23510-2-rgumasta@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Rajesh,

On 25/07/25 10:52, Rajesh Gumasta wrote:
> Add a new device-tree binding for a 'reg-settings' node that can be
> added to any device. This 'reg-settings' is used to populate register
> settings that need to be programmed for a given operating mode of the
> device. An example usage of the 'reg-settings' node is shown below for
> the NVIDIA Tegra MMC controller which needs to program a specific
> 'num-tuning-iterations' value in a register field for each operating
> mode:
> 
>    mmc@700b0000 {
> 
>      reg-settings {
> 
>        default-settings {
>          /* Default register setting */
>          nvidia,num-tuning-iterations = <0>;
>        };
> 
>        sdr50 {
>          /* SDR50 register setting */
>          nvidia,num-tuning-iterations = <4>;
>        };
> 
>        sdr104 {
>          /* SDR104 register setting */
>          nvidia,num-tuning-iterations = <2>;
>        };
> 
>        hs200 {
>          /* HS200 register setting */
>          nvidia,num-tuning-iterations = <2>;
>        };
>      };
>    };
> 
> The 'reg-settings' child nodes are defined according to the operating
> modes supported for a given device. Properties within each operating
> mode are then defined by the bindings for the devices that require them.
> 
> Signed-off-by: Rajesh Gumasta <rgumasta@nvidia.com>
> ---
>   .../bindings/regset/register-settings.yaml    | 31 +++++++++++++++++++
>   1 file changed, 31 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/regset/register-settings.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regset/register-settings.yaml b/Documentation/devicetree/bindings/regset/register-settings.yaml
> new file mode 100644
> index 000000000000..4366cdd72813
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regset/register-settings.yaml
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regset/register-settings.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Register Settings
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Krishna Yarlagadda <kyarlagadda@nvidia.com>
> +  - Rajesh Gumasta <rgumasta@nvidia.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +description: |
> +  Register Settings provides a generic way to specify register configurations
> +  for any hardware controllers. Settings are specified under a "reg-settings"
> +  sub-node under the controller device tree node. It allows defining both
> +  default and operating mode specific register settings in the device tree.
> +
> +properties:
> +  reg-settings:
> +    type: object
> +    description: |
> +      Container node for register settings configurations. Each child node
> +      represents a specific configuration mode or operating condition.
> +
> +    additionalProperties:
> +      type: object
> +
> +additionalProperties: true

Following your series, I would like to bring to your attention that
Texas Instruments SoCs also have a component which requires similar kind
of configuration, named Timesync Router(TSR). It enables the
multiplexing of M inputs to N outputs, where inputs can be selectively
driven based on N output configuration. A detailed explanation of the
TSR and our attempts we tried to implement TSR can be found in following
RFC series:
https://lore.kernel.org/all/20250605063422.3813260-1-c-vankar@ti.com/
https://lore.kernel.org/all/20250205160119.136639-1-c-vankar@ti.com/

To implement TSR, the relevant registers must be configured via the
device tree. We initially assumed that the device could be handled as a
mux-controller and could be extended in the same subsystem, but it was
ineffective. Having explored both the approaches, we now plan to
implement TSR within misc subsystem, which aligns with the dt-bindings
that you have proposed in this series.

The purpose to replying over this series is to inform you that we also
have a component requiring configuration as outlined in this series. Let
us know if you have any suggestions for this.

Regards,
Chintan.


