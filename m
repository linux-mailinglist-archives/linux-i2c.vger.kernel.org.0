Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACC59373576
	for <lists+linux-i2c@lfdr.de>; Wed,  5 May 2021 09:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbhEEHTL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 May 2021 03:19:11 -0400
Received: from muru.com ([72.249.23.125]:51824 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231826AbhEEHTK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 May 2021 03:19:10 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CDED380DB;
        Wed,  5 May 2021 07:18:13 +0000 (UTC)
Date:   Wed, 5 May 2021 10:18:08 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH] dt-bindings: i2c: Move i2c-omap.txt to YAML format
Message-ID: <YJJGsGXBz56Nhe8z@atomide.com>
References: <20210505065511.918-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210505065511.918-1-vigneshr@ti.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

* Vignesh Raghavendra <vigneshr@ti.com> [210505 06:55]:
> Convert i2c-omap.txt to YAML schema for better checks and documentation.

Nice to see this happening, few minor comments below on handling the
legacy devices.

> +properties:
> +  compatible:
> +    oneOf:
> +      - const: ti,omap2420-i2c
> +      - const: ti,omap2430-i2c
> +      - const: ti,omap3-i2c
> +      - const: ti,omap4-i2c
> +      - items:
> +          - enum:
> +              - ti,am4372-i2c
> +              - ti,am64-i2c
> +              - ti,am654-i2c
> +              - ti,j721e-i2c
> +          - const: ti,omap4-i2c

I wonder if we should just add all the compatible options to the
driver, and have all these as oneOf?

> +  ti,hwmods:
> +    description:
> +      Must be "i2c<n>", n being the instance number (1-based)
> +    $ref: /schemas/types.yaml#/definitions/string
> +    items:
> +      - pattern: "^i2c([1-9])$"

The ti,hwmods is a legacy property that is only needed for omap2/3 and
ti81xx. At least the description should mention that to avoid folks
adding it accidentally.

Regards,

Tony
