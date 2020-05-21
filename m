Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D66B1DCF02
	for <lists+linux-i2c@lfdr.de>; Thu, 21 May 2020 16:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729657AbgEUOIV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 May 2020 10:08:21 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:42128 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729524AbgEUOIV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 May 2020 10:08:21 -0400
Received: by mail-io1-f68.google.com with SMTP id e18so7529789iog.9;
        Thu, 21 May 2020 07:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hkdAaLYIc0WsgyOtF7HphxQvDajMRAVCt9ecUnq6cSs=;
        b=Fbiiu2fJG9C7TBtudUc6SxEodeeZc1NkCWFT6jwPHtAfhtI5ygQsRlaXOXAf0H1g2o
         wzFev57NiThIJ9vPKelCXm5/MlPK3HqiJ14TGc0VaXXyqVcUQqdhkpQOOjsCjOHMAsUl
         B4AuoksHZjRUiiqONa31wAQnzZeofLXGu3/g9q1mcve+RfzVA8u/BqKBRsmAMYwd6NSw
         o6En09gD8DzaqvOcjgvtOyPn2GQJEBWbRE8OknT5jaGu5n8H4HhkkfrNSAUsXwavX6Te
         VmEMg3mkbpJ2kMQQ/l/wtb8wMR8269+Nx+ePy0pyFAw5LpMhzzCYc5RrbBbalkBgxulQ
         Z13w==
X-Gm-Message-State: AOAM530vSK1+XB70e+TlBcGtAPVCeX0lt4oVbLnvpqm4W+SuWOKomF3E
        S/GKb9AnOB6mpoNcjlLzqA==
X-Google-Smtp-Source: ABdhPJzuJXTY4mbZgkKCxsK6OiELIu9X1jZKqPMjnJt3n48gVbBt7CPOXr61k8mGVP/9ied0TyLdOw==
X-Received: by 2002:a02:90cd:: with SMTP id c13mr3832204jag.83.1590070100265;
        Thu, 21 May 2020 07:08:20 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c13sm3060220ilu.81.2020.05.21.07.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 07:08:18 -0700 (PDT)
Received: (nullmailer pid 2308939 invoked by uid 1000);
        Thu, 21 May 2020 14:08:17 -0000
Date:   Thu, 21 May 2020 08:08:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     robh+dt@kernel.org, ofery@google.com, venture@google.com,
        wsa@the-dreams.de, yuenn@google.com, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, avifishman70@gmail.com,
        andriy.shevchenko@linux.intel.com, tmaimon77@gmail.com,
        benjaminfair@google.com, kfting@nuvoton.com,
        brendanhiggins@google.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 1/3] dt-bindings: i2c: npcm7xx: add NPCM I2C
 controller
Message-ID: <20200521140817.GA2308392@bogus>
References: <20200520095113.185414-1-tali.perry1@gmail.com>
 <20200520095113.185414-2-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520095113.185414-2-tali.perry1@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 20 May 2020 12:51:11 +0300, Tali Perry wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM I2C controller.
> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dts:22.28-29 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:312: recipe for target 'Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1294210

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

