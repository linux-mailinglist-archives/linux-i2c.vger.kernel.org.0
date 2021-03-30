Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 191D934F3FB
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 00:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232836AbhC3WFu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 18:05:50 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:39812 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232848AbhC3WFp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Mar 2021 18:05:45 -0400
Received: by mail-oi1-f178.google.com with SMTP id i81so17997207oif.6;
        Tue, 30 Mar 2021 15:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K57+sZPGNUEdeNlTqUnowLYV4JcIVUw0MSAp4gezLB4=;
        b=ar0u/vif3EZklzDAs65+BIaMKVjH5XGbjHt7rSA1peilbk27WgN7CpduZf9aPREhir
         nLjzKhObMMVca6fMdxb3qL0grWZ4VhaNyLIkz1WwTny2dcRCpznnvblwmFECt77FatMD
         JbiqagqTtxl9XfOtaGqvF6Sp6fUNQfHG+buwn7x98aquJWcozqB1xGUf3IfAgxyivZsV
         g/fJ0we0bJsGm3V0MEzBxiv1i8EwbkelN/k6CZNbzvRtonihBkpcuIxtQNPzN/VUQ9Ki
         7WgIKZK5067T6Zx/At4IH5pUhMjU+ytJUWK+XCTYnfujoiQ/uYHeZTmhnnM40CvXEaCF
         /fvw==
X-Gm-Message-State: AOAM531aDPpHgHTxZ5wzJFe5zdwLdXCTOGjBKLpXoCdUdI56T72fZ58l
        eHcOjlgxqRXtPLhxwOgjbGcyVfn3Lg==
X-Google-Smtp-Source: ABdhPJyjT4fITT5nkHsfFaZVDJZo+ZYrw/hsB/2n8AZ79xoGHPmTkbIWolYQQdVP8dc22ukOImDz5w==
X-Received: by 2002:a05:6808:13d0:: with SMTP id d16mr53428oiw.169.1617141945047;
        Tue, 30 Mar 2021 15:05:45 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h9sm41272ooi.22.2021.03.30.15.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 15:05:44 -0700 (PDT)
Received: (nullmailer pid 797160 invoked by uid 1000);
        Tue, 30 Mar 2021 22:05:43 -0000
Date:   Tue, 30 Mar 2021 17:05:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Corey Minyard <minyard@acm.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Wolfram Sang <wsa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v1 3/3] bindings: ipmi: Add binding for Aspeed SSIF BMC
 driver
Message-ID: <20210330220543.GA795792@robh.at.kernel.org>
References: <20210329121759.5644-1-quan@os.amperecomputing.com>
 <20210329121759.5644-4-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329121759.5644-4-quan@os.amperecomputing.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 29, 2021 at 07:17:59PM +0700, Quan Nguyen wrote:
> Add device tree binding document for the Aspeed SSIF BMC driver.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
>  .../bindings/ipmi/aspeed-ssif-bmc.txt          | 18 ++++++++++++++++++

Bindings should now be in DT schema format.

>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt
> 
> diff --git a/Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt b/Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt
> new file mode 100644
> index 000000000000..1616f0188db9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt
> @@ -0,0 +1,18 @@
> +# Aspeed SSIF (SMBus system interface) IPMI BMC interface
> +
> +The Aspeed AST2500 are commonly used as BMCs (Baseboard Management Controllers)
> +and the SSIF slave interface can be used to perform in-band IPMI communication
> +with their host.
> +
> +Required properties:
> +
> +- compatible : should be
> +       "aspeed,ast2500-ssif-bmc"
> +- reg: I2C address the registers
> +
> +Example:
> +
> +       ssif-bmc@10 {
> +               compatible = "aspeed,ast2500-ssif-bmc";
> +               reg = <0x10>;
> +       };
> -- 
> 2.28.0
> 
