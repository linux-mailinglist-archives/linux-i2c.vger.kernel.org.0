Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B25DA34B86D
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Mar 2021 18:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhC0RTS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 27 Mar 2021 13:19:18 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:44933 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbhC0RSq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 27 Mar 2021 13:18:46 -0400
Received: by mail-oi1-f176.google.com with SMTP id a8so8997236oic.11;
        Sat, 27 Mar 2021 10:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PEy8pCun/NiviG6BA0cBYJQREcIYJ1X5sQiOW0s7OPs=;
        b=iJxyU3vQin6vNMaAqIPuRWGk4CrPZQ4LcwB0Hu0hd3rK/YIkNRgeNCDlk4UCQvT+I0
         0coxxlaopE3kw6pvaOnNuPx7Rj1UKK7P6MbB8V2bzyUZ5jpqkIVHFQbMgsGa8nOx6j3W
         Xq1L2dLN0DNhZIBOqDjX3E2aQDNYLSDMcIhguQElClMIaX2NIbQALP5C8h6QLyD9zdWM
         iONqWlqXuvhmiRdwLq5Uy/P7N5HYLBK33zbysLFFZ21P3kQotg1nJdCc13Ge5W0aCt2E
         VKyBjmp0TyKPll3UGqyb1XGlklmCrmVZcoZ5cxUHssc526djKpXRO4e4ojxfZY6rIgNW
         90DA==
X-Gm-Message-State: AOAM531+gG7ZvzW1KNH60LKUO3ktF4/fOtXMmu6NqJ1uRnnrOCKzbwNb
        ryQlhvxI/P3SZgD1gZhL5d7iwBusOA==
X-Google-Smtp-Source: ABdhPJwBSUpnogc4ZFhpkavGvIHCwVUyyMBFxsJ+gvAAlKxbXwA9Y/WJp3tX1OMdzUn3y74yawqK9Q==
X-Received: by 2002:aca:b06:: with SMTP id 6mr13818057oil.73.1616865525926;
        Sat, 27 Mar 2021 10:18:45 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.107.88])
        by smtp.gmail.com with ESMTPSA id e34sm2961340ote.70.2021.03.27.10.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 10:18:44 -0700 (PDT)
Received: (nullmailer pid 268199 invoked by uid 1000);
        Sat, 27 Mar 2021 17:18:41 -0000
Date:   Sat, 27 Mar 2021 11:18:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: i2c: convert i2c-mpc to json-schema
Message-ID: <20210327171841.GA263078@robh.at.kernel.org>
References: <20210323043331.21878-1-chris.packham@alliedtelesis.co.nz>
 <20210323043331.21878-3-chris.packham@alliedtelesis.co.nz>
 <20210323211539.GB1326908@robh.at.kernel.org>
 <7ef36459-e23a-64cd-e9e1-35fb6cb9279f@alliedtelesis.co.nz>
 <00052125-3dc3-aad5-35df-957bc09a0840@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00052125-3dc3-aad5-35df-957bc09a0840@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 24, 2021 at 03:36:13AM +0000, Chris Packham wrote:
> 
> On 24/03/21 10:59 am, Chris Packham wrote:
> >
> > On 24/03/21 10:15 am, Rob Herring wrote:
> >> On Tue, Mar 23, 2021 at 05:33:27PM +1300, Chris Packham wrote:
> >>> Convert i2c-mpc to YAML.
> >>>
> >>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> >>> ---
> <snip>
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> >>> @@ -0,0 +1,99 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: I2C-Bus adapter for MPC824x/83xx/85xx/86xx/512x/52xx SoCs
> >>> +
> >>> +maintainers:
> >>> +  - Chris Packham <chris.packham@alliedtelesis.co.nz>
> >>> +
> >>> +allOf:
> >>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    anyOf:
> >>> +      - items:
> >>> +        - enum:
> >>> +          - mpc5200-i2c
> >>> +          - fsl,mpc5200b-i2c
> >>> +          - fsl,mpc5200-i2c
> >>> +          - fsl,mpc5121-i2c
> >>> +          - fsl,mpc8313-i2c
> >>> +          - fsl,mpc8543-i2c
> >>> +          - fsl,mpc8544-i2c
> >>> +
> >>> +        - const: fsl-i2c
> >>> +
> >>> +      - contains:
> >>> +          const: fsl-i2c
> >>> +        minItems: 1
> >>> +        maxItems: 4
> >> Can't we drop this and list out any other compatibles?
> >
> > I'm struggling a little bit with how to get the schema right to allow 
> > one or more of a set of compatible values.
> >
> > Basically I want to allow 'compatible = "fsl-i2c";' or 'compatible = 
> > "fsl,mpc8544-i2c", "fsl-i2c";' but disallow 'compatible = "foobar", 
> > "fsl-i2c";'
> 
> This is what I've ended up with
> 
> properties:
> compatible:
> oneOf:
>        - items:
>            - enum:
>                - mpc5200-i2c
>                - fsl,mpc5200-i2c
>                - fsl,mpc5121-i2c
>                - fsl,mpc8313-i2c
>                - fsl,mpc8543-i2c
>                - fsl,mpc8544-i2c
>                - fsl-i2c

This one should be dropped. '"fsl-i2c", "fsl-i2c"' presumably isn't 
valid. There's a generic check for unique entries anyways, so it would 
still fail.

>            - const: fsl-i2c
>        - items:
>            - const: fsl,mpc5200b-i2c
>            - const: fsl,mpc5200-i2c
>            - const: fsl-i2c
> 
> It passes `make dt_binding_check` and rejects things when I add other 
> non-documented values to the compatible property. I did struggle with it 
> so I'm not confident it's the best approach but it seems to work.

Otherwise, looks right to me.

Rob

