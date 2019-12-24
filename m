Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7216D129E72
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Dec 2019 08:32:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfLXHc3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Dec 2019 02:32:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:57908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbfLXHc3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Dec 2019 02:32:29 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 68302206B7;
        Tue, 24 Dec 2019 07:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577172748;
        bh=e5Lx3fav9aHPYbQQLVJ8r8urYsQzhkPfNR/pW89IEzY=;
        h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
        b=PVIP/PkURFqmzZPXEhTK+7hdJGt4rFx3a65T+psJM2DkPh6q9hIHwk44H8ZMbvFrd
         pBnyZt15MphKr7xhE8x8Noymtxtox9Hpdrn1GpNvhEaUa/tp8paBn2AgzuMahysl3k
         4FuRhM56J6bhoOXik71QYxVB7Hce3NCHpFVY4YvM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191209183511.3576038-6-daniel@zonque.org>
References: <20191209183511.3576038-1-daniel@zonque.org> <20191209183511.3576038-6-daniel@zonque.org>
Cc:     mturquette@baylibre.com, robh+dt@kernel.org, broonie@kernel.org,
        lee.jones@linaro.org, lars@metafoo.de, pascal.huerst@gmail.com,
        Daniel Mack <daniel@zonque.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Daniel Mack <daniel@zonque.org>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/10] dt-bindings: clock: Add documentation for AD242x clock providers
User-Agent: alot/0.8.1
Date:   Mon, 23 Dec 2019 23:32:27 -0800
Message-Id: <20191224073228.68302206B7@mail.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting Daniel Mack (2019-12-09 10:35:05)
> diff --git a/Documentation/devicetree/bindings/clock/adi,ad242x-clk.yaml =
b/Documentation/devicetree/bindings/clock/adi,ad242x-clk.yaml
> new file mode 100644
> index 000000000000..f434b3e4928e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/adi,ad242x-clk.yaml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/clock/adi,ad242x-clk.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Analog Devices AD242x clock provider
> +
> +maintainers:
> +  - Daniel Mack <daniel@zonque.org>
> +
> +description: |
> +  This module is part of the AD242x MFD device. For more details and an =
example
> +  refer to Documentation/devicetree/bindings/mfd/ad242x.yaml.

I think we usually leave off Documentation/devicetree/ from paths when
they're inside the bindings directory.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ad2428w-clk
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clock-output-names:
> +    minItems: 2
> +    maxItems: 2
> +    description: |
> +      Array of two strings to use as names for the generated output cloc=
ks
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> \ No newline at end of file

Why no newline at end of file? Is there an example?

