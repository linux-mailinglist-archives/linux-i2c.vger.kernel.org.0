Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECA62E9234
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2019 22:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728485AbfJ2Vi7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Oct 2019 17:38:59 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46649 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727706AbfJ2Vi7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Oct 2019 17:38:59 -0400
Received: by mail-ot1-f67.google.com with SMTP id 89so217210oth.13;
        Tue, 29 Oct 2019 14:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EmXVX6+bbwDU1SIK2TA3/O1fjzSB8iJHsejYM/C5Sjk=;
        b=n5s9zOrwXB06K1MDud6zXkHwvcu71WdEB5Z0VjvQVm906qtJxJkLcFkYW7lPmPF7Jk
         xfpo83nhVDD1S+sOomoh2BPYeIM09xSYpDUlnri5uK2I5c8wsxeSieuregi9KtEs56+C
         QzE3yUA1G5u7K9UY6JVlaTltESs/g8yq1FtmYMzzadnGferjtRlzYlMZhzInUMYa6YwU
         1g7cmTHxnWKlgRDuRobn+ZzI5lQGEn+7ovwAklMgNg5QTcWiDdVFkQf2TTmX0VyZvPbh
         oMnkOcL0KhJRrxyJJSCKNOBUfGtOD/tHMx0mJyailGSLqEi0fs4+KYZb8wYQmrLLRXNs
         Grkw==
X-Gm-Message-State: APjAAAUTqm3qpacDRJZrzTwRK94jSuutwXcB7g0GEMShIw574+lYwpz6
        z4PSGV/vd+z7jjMAPUQ8xA==
X-Google-Smtp-Source: APXvYqztsd7ta/nIckw9LZDMMkhVG2JWedmw2E3pc+aIIkr8LZx4EkIFtUGlFL99EL0MoJ21WwCh5Q==
X-Received: by 2002:a9d:6f14:: with SMTP id n20mr15343927otq.196.1572385138447;
        Tue, 29 Oct 2019 14:38:58 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l32sm67554otl.74.2019.10.29.14.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 14:38:57 -0700 (PDT)
Date:   Tue, 29 Oct 2019 16:38:57 -0500
From:   Rob Herring <robh@kernel.org>
To:     Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        devicetree@vger.kernel.org,
        Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: i2c: at91: document optional bus
 recovery properties
Message-ID: <20191029213857.GA13250@bogus>
References: <20191024201302.23376-1-kamel.bouhara@bootlin.com>
 <20191024201302.23376-3-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191024201302.23376-3-kamel.bouhara@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 24 Oct 2019 22:12:59 +0200, Kamel Bouhara wrote:
> The at91 I2C controller can support bus recovery by re-assigning SCL
> and SDA to gpios. Add the optional pinctrl and gpio properties to do
> so.
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-at91.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
