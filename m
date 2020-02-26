Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5219A1709C0
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2020 21:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbgBZUef (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Feb 2020 15:34:35 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38515 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727338AbgBZUee (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Feb 2020 15:34:34 -0500
Received: by mail-oi1-f195.google.com with SMTP id r137so914850oie.5;
        Wed, 26 Feb 2020 12:34:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g38WTB18JhCFv+6ZOFn1mFF8E88WbmXC5QB3ILBLh5g=;
        b=krxa8BiuhnAX3QODxqWTn2e6jRSKA/JYxhK57vFoOUn2txfCfuGtbB3GpD0EODNfCD
         hx+xnvld0WLUWXQbuUZWr6Kk39uhOAPK3c/OHFuRVlMTBUNcQ0YjTM2sfyPOTes2nJS5
         w8gt34M+LQPtEh0ZDx6h3EsTaT7xJMCi+tHImB5+Rps6wAQVsOGm/xI+TmEXIvI/yxMy
         V1udj09ISvvw3KmailZjGm6qaviJMdjOMDT8bJkxuvBM4feJQGIzFyUK0fIzlxqDDjD6
         oH9uG5PBJTtvaykOn0VnW38NZOF4kH2RKonjcbEXJXHmElJesBtwrlEGt+vDTfKCy+Ui
         uRDw==
X-Gm-Message-State: APjAAAX1N5DMapLpoMxxmRmxGF4Ei2JS5/AKqsFgvBp8oHCZpK8gPwFs
        Wm0aMkjvd6cY8YnZEF4Uhc1VRW+1Lg==
X-Google-Smtp-Source: APXvYqyGtvkvTxCpSFD4c3rzHVBzhhOroqa8rv0PQZz+x5+8Osdwr6m2ApJLFIqW9SVmXxpgvaweVw==
X-Received: by 2002:a05:6808:289:: with SMTP id z9mr663297oic.48.1582749273458;
        Wed, 26 Feb 2020 12:34:33 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r205sm1173159oih.54.2020.02.26.12.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 12:34:32 -0800 (PST)
Received: (nullmailer pid 12641 invoked by uid 1000);
        Wed, 26 Feb 2020 20:34:31 -0000
Date:   Wed, 26 Feb 2020 14:34:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-i2c@vger.kernel.org, mark.rutland@arm.com,
        bleung@chromium.org, groeck@chromium.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sebastian.reichel@collabora.com
Subject: Re: [PATCH v4 1/2] dt-bindings: i2c: cros-ec-tunnel: convert
 i2c-cros-ec-tunnel.txt to yaml
Message-ID: <20200226203431.GA5708@bogus>
References: <20200221123214.26341-1-dafna.hirschfeld@collabora.com>
 <f903795e-cd62-7407-2da2-bea3a1df8da0@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f903795e-cd62-7407-2da2-bea3a1df8da0@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Feb 21, 2020 at 04:28:59PM +0100, Enric Balletbo i Serra wrote:
> Hi Dafna,
> 
> On 21/2/20 13:32, Dafna Hirschfeld wrote:
> > Convert the binding file i2c-cros-ec-tunnel.txt to yaml format.
> > 
> > This was tested and verified on ARM and ARM64 with:
> > 
> > make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.yaml
> > make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.yaml
> > 
> > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > ---
> > Changes since v1:
> > - changing the subject to start with "dt-bindings: i2c: cros-ec-tunnel:"
> > - changing the license to (GPL-2.0-only OR BSD-2-Clause)
> > - removing "Guenter Roeck <groeck@chromium.org>" from the maintainers list
> > - adding ref: /schemas/i2c/i2c-controller.yaml
> > 
> > Changes since v2:
> > - adding another patch that fixes a warning found by this patch
> > 
> > Changes since v3:
> > - In the example, change sbs-battery@b to battery@b
> > 
> > 
> >  .../bindings/i2c/i2c-cros-ec-tunnel.txt       | 39 ------------
> >  .../bindings/i2c/i2c-cros-ec-tunnel.yaml      | 63 +++++++++++++++++++
> >  2 files changed, 63 insertions(+), 39 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt
> >  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.yaml
> > 
> 
> According to the feedback I received on another patch from Rob, seems that you
> should name the file with the full compatible string
> "google,i2c-cros-ec-tunnel.yaml"
> 
> I know we didn't do this with the extcon-usbc-cros-ec.yaml but seems this is the
> right way to do it. Just take this in consideration for future patches.
> 
> 
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt b/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt
> > deleted file mode 100644
> > index 898f030eba62..000000000000
> > --- a/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt
> > +++ /dev/null
> > @@ -1,39 +0,0 @@
> > -I2C bus that tunnels through the ChromeOS EC (cros-ec)
> > -======================================================
> > -On some ChromeOS board designs we've got a connection to the EC (embedded
> > -controller) but no direct connection to some devices on the other side of
> > -the EC (like a battery and PMIC).  To get access to those devices we need
> > -to tunnel our i2c commands through the EC.
> > -
> > -The node for this device should be under a cros-ec node like google,cros-ec-spi
> > -or google,cros-ec-i2c.
> > -
> > -
> > -Required properties:
> > -- compatible: google,cros-ec-i2c-tunnel
> > -- google,remote-bus: The EC bus we'd like to talk to.
> > -
> > -Optional child nodes:
> > -- One node per I2C device connected to the tunnelled I2C bus.
> > -
> > -
> > -Example:
> > -	cros-ec@0 {
> > -		compatible = "google,cros-ec-spi";
> > -
> > -		...
> > -
> > -		i2c-tunnel {
> > -			compatible = "google,cros-ec-i2c-tunnel";
> > -			#address-cells = <1>;
> > -			#size-cells = <0>;
> > -
> > -			google,remote-bus = <0>;
> > -
> > -			battery: sbs-battery@b {
> > -				compatible = "sbs,sbs-battery";
> > -				reg = <0xb>;
> > -				sbs,poll-retry-count = <1>;
> > -			};
> > -		};
> > -	}
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.yaml b/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.yaml
> > new file mode 100644
> > index 000000000000..cfe4f0aeb46f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.yaml
> > @@ -0,0 +1,63 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i2c/i2c-cros-ec-tunnel.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: I2C bus that tunnels through the ChromeOS EC (cros-ec)
> > +
> > +maintainers:
> > +  - Benson Leung <bleung@chromium.org>
> > +  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > +
> > +description: |
> > +  On some ChromeOS board designs we've got a connection to the EC (embedded
> > +  controller) but no direct connection to some devices on the other side of
> > +  the EC (like a battery and PMIC). To get access to those devices we need
> > +  to tunnel our i2c commands through the EC.
> > +  The node for this device should be under a cros-ec node like google,cros-ec-spi
> > +  or google,cros-ec-i2c.
> > +
> > +allOf:
> > +  - $ref: /schemas/i2c/i2c-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const:
> > +      google,cros-ec-i2c-tunnel
> > +
> > +  google,remote-bus:
> > +    $ref: "/schemas/types.yaml#/definitions/uint32"
> > +    description: The EC bus we'd like to talk to.
> > +
> > +  "#address-cells": true
> > +  "#size-cells": true
> > +
> > +patternProperties:
> > +  "^.*@[0-9a-f]+$":
> > +    type: object
> > +    description: One node per I2C device connected to the tunnelled I2C bus.
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - google,remote-bus
> > +
> > +examples:
> > +  - |
> > +    cros-ec@0 {
> > +        compatible = "google,cros-ec-spi";
> 
> Like we did with the extcon-usbc-cros-ec.yaml I think would be nice have a
> complete example here too.

Yes, or once we have a schema for "google,cros-ec-spi" it will start 
failing. With these MFDs, it's going to be easier to just have 1 
complete example instead of bits and pieces spread around.

Rob
