Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE21B497280
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jan 2022 16:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237575AbiAWP3B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Jan 2022 10:29:01 -0500
Received: from mail-oo1-f52.google.com ([209.85.161.52]:45644 "EHLO
        mail-oo1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237573AbiAWP24 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 Jan 2022 10:28:56 -0500
Received: by mail-oo1-f52.google.com with SMTP id u25-20020a4ad0d9000000b002e8d4370689so152031oor.12;
        Sun, 23 Jan 2022 07:28:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7SgwYqH7zj+hX/MVJFD9dYrHakNEmWeT2bOmPFj2+JM=;
        b=GTkdhKI6ycbOkamJPK3QhSnmTQ7Vmi7R1TlGN/c5pFH2VDhYzqpTkRsCc0X9lZmZD6
         4eBMDUKkAW3+f8v0knZCe80bvjAk5omoyivGDAEQ4l+4we20KR/XtzmczUJ+NyGR4pg3
         CJmSif3LJBKz/7H4rqZ5xwqMBbU9itrfo66Weym4Dq7A+cFPgKtFC9m3nJYj9xO3C+p4
         XYl9RxfJXEz3cr9zClMh1Ks9ubX1+JCF55Cx1Bo+lHCCSqjECNQ0ZDbBgDValTBeOhFh
         Bvhg+YDAGT64hNRoM49VVTjtM7gN5gZp9sao7NJM85A8TW3eeG0MkQefMm0xm5eZlFHP
         JIpA==
X-Gm-Message-State: AOAM532RwH+m05Bk9Mfw7WrkrJ30gfEg+VzUfDOyZrU0JngqxfJ3cMia
        cSoZPfMxyf1tCn8VMiF7jE07cNDukg==
X-Google-Smtp-Source: ABdhPJyr+Ecl4tmtkayhNZ8hh0IgX4RclGEFQjy7tbc5O0yVSvqbTABPYygVW5UfebTlzOZib6Fd7Q==
X-Received: by 2002:a4a:9c92:: with SMTP id z18mr7897614ooj.83.1642951735493;
        Sun, 23 Jan 2022 07:28:55 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bg12sm4028308oib.25.2022.01.23.07.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 07:28:54 -0800 (PST)
Received: (nullmailer pid 1428364 invoked by uid 1000);
        Sun, 23 Jan 2022 15:28:54 -0000
Date:   Sun, 23 Jan 2022 09:28:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] dt-bindings: ingenic,i2c: Rework interrupts in example
Message-ID: <Ye10NsR8MYHhUDwX@robh.at.kernel.org>
References: <20220119174349.3809513-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119174349.3809513-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 19 Jan 2022 11:43:49 -0600, Rob Herring wrote:
> In order to determine the number of interrupt cells in examples, the
> examples will require all 'interrupts' properties to use the same number
> of cells or have explicit interrupt provider node(s). As the former is
> simpler, update the Ingenic example to use 2 interrupt cells everywhere.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Applied, thanks!
