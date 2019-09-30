Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 229D4C2754
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2019 22:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731051AbfI3UxB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Sep 2019 16:53:01 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38099 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbfI3UxA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Sep 2019 16:53:00 -0400
Received: by mail-ot1-f65.google.com with SMTP id e11so9605204otl.5;
        Mon, 30 Sep 2019 13:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qttcrBHS0kIn8DMgwWljur1/ogNYEuQG7wPRDTGlx3M=;
        b=Muxh408k0X9cXxPp2LPXLtbDx5bTsAE2n+l+7TzUT76+8ZvhR+RZyJKO1VLGABMME7
         BanJUeAT86GhLqc+xMrYmJ2efriH0qtl0FYwuwCuDyklNU07Ujn2bRxeYROl3gZ0/oFl
         79/T7i0lWn8YQy4yN/6h7cRKoC7222y5loj+Fi2+9FYUpr+OYNpISWApr6DerqTrSCRL
         ukADVYWQgA1mNx0MLZA2rufk7DLn0vcCBXbwysu6PU0eZ2hbmzNC84WZGZCt8kwqj+zD
         8UZiyjJZ8tjI6xCUlMLY6adYmsNgMCrhqz0PLFBgT+qKHJM7BWhoMVz9atahKt8Leuzx
         SccQ==
X-Gm-Message-State: APjAAAXEMmyZzPG5eYfbKYINZkEWFszBctdYY9KdkfqsDkmWGOY0rs0S
        LaVAjVPOM53/s2R5H3MYXfOXoEQ=
X-Google-Smtp-Source: APXvYqxBaCMEenuVO/TLEa22+nQKS8epFGf8JVek9VBh07i8c+Qw+sc7bz02Xq20jisGQ0FY5ulbtA==
X-Received: by 2002:a9d:6084:: with SMTP id m4mr14638230otj.6.1569869959652;
        Mon, 30 Sep 2019 11:59:19 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 5sm4127490otp.20.2019.09.30.11.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 11:59:19 -0700 (PDT)
Date:   Mon, 30 Sep 2019 13:59:18 -0500
From:   Rob Herring <robh@kernel.org>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        brendanhiggins@google.com, joel@jms.id.au, andrew@aj.id.au,
        mark.rutland@arm.com, benh@kernel.crashing.org
Subject: Re: [PATCH 2/2] dt-bindings: i2c: Aspeed: Add AST2600 compatible
Message-ID: <20190930185918.GA18431@bogus>
References: <1568392510-866-1-git-send-email-eajames@linux.ibm.com>
 <1568392510-866-3-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568392510-866-3-git-send-email-eajames@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 13, 2019 at 11:35:10AM -0500, Eddie James wrote:
> Document the AST2600 I2C bus compatible string.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-aspeed.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> index 8fbd863..b47f6cc 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> @@ -1,4 +1,4 @@
> -Device tree configuration for the I2C busses on the AST24XX and AST25XX SoCs.
> +Device tree configuration for the I2C busses on the AST24XX, AST25XX, and AST26XX SoCs.

Perhaps s/buses/busses/ while you're here.

Acked-by: Rob Herring <robh@kernel.org>

>  
>  Required Properties:
>  - #address-cells	: should be 1
> @@ -6,6 +6,7 @@ Required Properties:
>  - reg			: address offset and range of bus
>  - compatible		: should be "aspeed,ast2400-i2c-bus"
>  			  or "aspeed,ast2500-i2c-bus"
> +			  or "aspeed,ast2600-i2c-bus"
>  - clocks		: root clock of bus, should reference the APB
>  			  clock in the second cell
>  - resets		: phandle to reset controller with the reset number in
> -- 
> 1.8.3.1
> 
