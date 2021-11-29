Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B55F4621D5
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 21:10:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233260AbhK2UOL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 15:14:11 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:34675 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233549AbhK2UMI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 15:12:08 -0500
Received: by mail-oi1-f179.google.com with SMTP id t19so36815629oij.1;
        Mon, 29 Nov 2021 12:08:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z6xdOSQsfsaoPSj9BpA6Xmod/xwiCQkOb+qTA/iCb/o=;
        b=mMamZOPZMcT6WNosUBYp4n0oFl4pn33lkbNiYL2v2y6B4/u2/owYEVJXz+LHXOi5Pd
         2CFy4rszd1uh9pUDAtI8mtq4ICVebFJzEwIkEOxdYG/zQE3JoNNf3TnNiUG5sUXXHP5v
         mUGaYr7rRa8Wz0KvhXfikXqvya9TU9gvm8+QowWOQYGNb4uR8QN/eK83g80bdzRptWxJ
         2lx2uPGg8BWerrg8dpCv7IJVtbl9qaxDb+GZPKXKFpSY7hTPhE+0+ZalKLfWquFSWTDW
         EnPCIG7L0qCcg7l3Uud00uJ01eQ3lBFBdHQrhZ70Py7R/Rald8zrXHM5/Hivb8MgnCCr
         x0oA==
X-Gm-Message-State: AOAM531xdmA4PNRTdrpeSH7i0VQkE+WqucNk1Z+YriLf6dZWJSC3prmv
        U4LsHMhKaMspYayAXRq4KA==
X-Google-Smtp-Source: ABdhPJy2T7U5QNpYE8mKhDs4Y0kpsY4X+RruhTn7EbB9g52UuWIuwRJoXI1gDNqGmpcZq9IEms65YQ==
X-Received: by 2002:a05:6808:3c2:: with SMTP id o2mr241205oie.112.1638216529867;
        Mon, 29 Nov 2021 12:08:49 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id n6sm2837920otj.78.2021.11.29.12.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 12:08:49 -0800 (PST)
Received: (nullmailer pid 520021 invoked by uid 1000);
        Mon, 29 Nov 2021 20:08:47 -0000
Date:   Mon, 29 Nov 2021 14:08:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Conor.Dooley@microchip.com
Cc:     krzysztof.kozlowski@canonical.com, broonie@kernel.org,
        aou@eecs.berkeley.edu, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, palmer@dabbelt.com,
        paul.walmsley@sifive.com, jassisinghbrar@gmail.com,
        atish.patra@wdc.com, Daire.McNamara@microchip.com,
        Lewis.Hanly@microchip.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, geert@linux-m68k.org,
        linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-usb@vger.kernel.org,
        bin.meng@windriver.com, linux-i2c@vger.kernel.org,
        alexandre.belloni@bootlin.com, Ivan.Griffin@microchip.com,
        linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
        a.zummo@towertech.it, gregkh@linuxfoundation.org
Subject: Re: [PATCH 06/13] dt-bindings: rng: add bindings for microchip mpfs
 rng
Message-ID: <YaUzT6+WvICiTk1q@robh.at.kernel.org>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-7-conor.dooley@microchip.com>
 <f60cf7e0-4f67-f4b3-2596-01114cff6623@canonical.com>
 <71c6917e-1463-c708-550a-726e5fe1566d@microchip.com>
 <ca17d6ac-ef8e-b01c-3278-7cbb0d5745e3@canonical.com>
 <ea871add-bddc-c4ae-ac9d-e86b4fad5a02@microchip.com>
 <a0713a10-3409-4401-e612-0a9c06f88ea1@canonical.com>
 <9d6f2e66-860c-2b8a-0b45-7dc56dd5298f@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d6f2e66-860c-2b8a-0b45-7dc56dd5298f@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 10, 2021 at 09:46:23AM +0000, Conor.Dooley@microchip.com wrote:
> On 10/11/2021 07:43, Krzysztof Kozlowski wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 09/11/2021 14:36, Conor.Dooley@microchip.com wrote:
> >> On 09/11/2021 12:56, Krzysztof Kozlowski wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> On 09/11/2021 13:54, Conor.Dooley@microchip.com wrote:
> >>>> On 08/11/2021 21:16, Krzysztof Kozlowski wrote:
> >>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>>>
> >>>>> On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
> >>>>>> From: Conor Dooley <conor.dooley@microchip.com>
> >>>>>>
> >>>>>> Add device tree bindings for the hardware rng device accessed via
> >>>>>> the system services on the Microchip PolarFire SoC.
> >>>>>>
> >>>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >>>>>> ---
> >>>>>>     .../bindings/rng/microchip,mpfs-rng.yaml      | 31 +++++++++++++++++++
> >>>>>>     1 file changed, 31 insertions(+)
> >>>>>>     create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> >>>>>>
> >>>>>> diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..e8ecb3538a86
> >>>>>> --- /dev/null
> >>>>>> +++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> >>>>>> @@ -0,0 +1,31 @@
> >>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>>>> +%YAML 1.2
> >>>>>> +---
> >>>>>> +$id: "http://devicetree.org/schemas/rng/microchip,mpfs-rng.yaml#"
> >>>>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> >>>>>> +
> >>>>>> +title: Microchip MPFS random number generator
> >>>>>> +
> >>>>>> +maintainers:
> >>>>>> +  - Conor Dooley <conor.dooley@microchip.com>
> >>>>>> +
> >>>>>> +properties:
> >>>>>> +  compatible:
> >>>>>> +    const: microchip,polarfire-soc-rng
> >>>>>> +
> >>>>>> +  syscontroller:
> >>>>>> +    maxItems: 1
> >>>>>> +    description: name of the system controller device node
> >>>>>
> >>>>> There are several issues with this:
> >>>>> 1. You need to describe the type.
> >>>>> 2. Description is not helpful (just copying the name of property) and
> >>>>> actually misleading because you do not put there the name of device node.
> >>>>> 3. What is it? Looks like syscon (or sometimes called sysreg). If yes,
> >>>>> please use existing syscon bindings.
> >>>> 1 & 2 - Correct, it is bad & I'll write a better description for it.
> >>>> 3 - Its a system controller implemented as a mailbox. The syscontroller
> >>>> is the mailbox client, which the rng and generic drivers both use.
> >>>
> >>> I understood that pointed device node is a mailbox, not this node. But
> >>> here, what is it here? How do you use it here?
> >> The system controller is the means of access to the random number
> >> generator. The phandle to the sys controller is provided here so that
> >> the rng driver can locate the mailbox client through which it requests
> >> random numbers.
> > 
> > I am asking this to understand whether there is a generic or existing
> > property which should be used instead.
> > 
> > If I understand correctly, the rng driver needs a mailbox client?
> Correct, it needs one. Binding for that is here:
> Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml

The rng node and others should be a child of the sys controller node.

Rob
