Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 024AD9EF91
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2019 18:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbfH0QAk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Aug 2019 12:00:40 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34975 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbfH0QAj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Aug 2019 12:00:39 -0400
Received: by mail-oi1-f193.google.com with SMTP id a127so15370338oii.2;
        Tue, 27 Aug 2019 09:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=D6+OaZ1K2BkxJDOEN54v4VflGey5EU83b3NbO+bgnw4=;
        b=R83W4VXOM39811hc7ah1l/VvLqF7w2RCjMzcTriCPq//1zlUgWBLnRS0jv7TgHyMpT
         U5GsXhGNoh3KHGrwaVNbVdCDv/jIO+3RMWVePQkLjpZsFgB5bi9N4UmB8r//rS5mYeDF
         p34a2K46yG3lXF35vhHsqymNK720ku4aGkgjrKUSxvXMth0pHXrLoMTljjWVgap9khWH
         +ZaAESa18fZf+Jt0ydP+Fo7WnWDY2Svgrxh+wsX8PB3V4/icLzohZAUeI5kadImeB6kg
         f0qbJ5/Q2xDLssY/1p+N6D9EVt+kEEHSQA/P929cpep8L4HF3rL9eTb0UwvoIzcvHd6O
         FxAA==
X-Gm-Message-State: APjAAAV5L6cCnzDK6GW3w1VBaaEtPP6ajsJTcLcTkM18bm2xDjd7LLEH
        cVazyyfwPX7k/cfDxbbNUJoIB/8=
X-Google-Smtp-Source: APXvYqzqysW8b9Vv/AGQrCdVBMtCuN+0jOLgEwEm5B32z9YhyzC8FzlR7LdSUXlhdBuSwDViFOa0Ig==
X-Received: by 2002:aca:4b83:: with SMTP id y125mr16540421oia.25.1566921638739;
        Tue, 27 Aug 2019 09:00:38 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y62sm5552699otb.69.2019.08.27.09.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 09:00:38 -0700 (PDT)
Date:   Tue, 27 Aug 2019 11:00:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH V2 07/13] dt-bindings: i2c: bcm2835: Add brcm,bcm2711
 compatible
Message-ID: <20190827160037.GA13627@bogus>
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
 <1565713248-4906-8-git-send-email-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565713248-4906-8-git-send-email-wahrenst@gmx.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 13 Aug 2019 18:20:42 +0200, Stefan Wahren wrote:
> Add a new compatible for the BCM2711, which hasn't the clock stretch bug.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
