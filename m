Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A23A418B5
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 01:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405793AbfFKXOc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 19:14:32 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:37016 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404483AbfFKXOc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jun 2019 19:14:32 -0400
Received: by mail-io1-f68.google.com with SMTP id e5so11395066iok.4;
        Tue, 11 Jun 2019 16:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/aBNuVSKZUriWZ/QesRFRpe/CatQ5nFG4Flo57Ca7og=;
        b=kYPVk0CdtTyL+LO372bZtevGC1OfLJkq0xMP3JI2NLRCFlMzTRduAvS1cF+nf48Lls
         Na1aA4Ae0h+IKNUgVDWrWRqPjsjmHeor3aZ9Ib7G6UERqhm1WGOJ24Eah2yWjeV2llBL
         7ZCxochSVYt4GmpHsEN4lweiuw2vYFwgFSdOZrifOCNBYVDb3NHnBCg/gABwtjyy/G4G
         A3lcV4OpvtVMT71+k6BZWAJPoQsSEVHUzgjqVkIBkhj7DhZKKB5gtBKgaTQeEMB61bYY
         aGF6/5eUuiQrt0/EbJ2zmMye0VNgxVUVzr/GKITcuS8hQ9wRqIOg0CEODA8VSFW/UfXm
         DYog==
X-Gm-Message-State: APjAAAUXLgcQTELhBpa9csztSQLTSEKWDzRS6t00V3GVJSd0waunZoRb
        XNjAwQkN+ys68cOntfBa6Q==
X-Google-Smtp-Source: APXvYqz2xuF/nmQmlAS4lGQnIm1qVqg5LZxj2mk9azk9SPNMol/s2XBeLKVU261Gt24zGJac7bjYWQ==
X-Received: by 2002:a05:6602:50:: with SMTP id z16mr2279838ioz.302.1560294870273;
        Tue, 11 Jun 2019 16:14:30 -0700 (PDT)
Received: from localhost (ip-174-149-252-64.englco.spcsdns.net. [174.149.252.64])
        by smtp.gmail.com with ESMTPSA id q79sm2054468itb.15.2019.06.11.16.14.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 16:14:29 -0700 (PDT)
Date:   Tue, 11 Jun 2019 17:14:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Eduardo Valentin <eduval@amazon.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@intel.com,
        brendanhiggins@google.com, Mark Rutland <mark.rutland@arm.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCHv7 1/3] dt-bindings: i2c: document bindings for
 i2c-slave-mqueue
Message-ID: <20190611231425.GA29500@bogus>
References: <20190605164651.15991-1-eduval@amazon.com>
 <20190605164651.15991-2-eduval@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605164651.15991-2-eduval@amazon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 05, 2019 at 09:46:49AM -0700, Eduardo Valentin wrote:
> Document the i2c-slave-mqueue binding by adding
> descriptor, required properties, and example.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: linux-i2c@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Eduardo Valentin <eduval@amazon.com>
> ---
> 
> Changes from V6 to V7:
> - none
> 
>  .../bindings/i2c/i2c-slave-mqueue.txt         | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-slave-mqueue.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-slave-mqueue.txt b/Documentation/devicetree/bindings/i2c/i2c-slave-mqueue.txt
> new file mode 100644
> index 000000000000..eb1881a4fc0e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-slave-mqueue.txt
> @@ -0,0 +1,34 @@
> +===============================================
> +Device Tree for I2C slave message queue backend
> +===============================================
> +
> +Some protocols over I2C/SMBus are designed for bi-directional transferring
> +messages by using I2C Master Write protocol. This requires that both sides
> +of the communication have slave addresses.

So the address 0x10 in the example below is the address of the I2C 
controller?

> +
> +This I2C slave mqueue (message queue) is used to receive and queue
> +messages from the remote i2c intelligent device; and it will add the target
> +slave address (with R/W# bit is always 0) into the message at the first byte.
> +
> +Links
> +----
> +`Intelligent Platform Management Bus
> +Communications Protocol Specification
> +<https://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/ipmp-spec-v1.0.pdf>`_
> +
> +`Management Component Transport Protocol (MCTP)
> +SMBus/I2C Transport Binding Specification
> +<https://www.dmtf.org/sites/default/files/standards/documents/DSP0237_1.1.0.pdf>`_
> +
> +Required Properties:
> +- compatible		: should be "i2c-slave-mqueue"

There is no mention of mqueue (or queue) in these specs. Where does that 
come from? Perhaps something more closely matching the protocol would be 
better name.

> +- reg			: slave address
> +
> +Example:
> +
> +i2c {

Would there be other slaves? 

The common binding states 'multi-master' property should be present. 

I need a more complete example.

> +	slave_mqueue: i2c-slave-mqueue {
> +		compatible = "i2c-slave-mqueue";
> +		reg = <0x10>;
> +	};
> +};
> -- 
> 2.21.0
> 
