Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3422F1D8984
	for <lists+linux-i2c@lfdr.de>; Mon, 18 May 2020 22:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgERUnf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 May 2020 16:43:35 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:44901 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726378AbgERUne (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 May 2020 16:43:34 -0400
Received: by mail-io1-f68.google.com with SMTP id f4so12169055iov.11;
        Mon, 18 May 2020 13:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XxCSYRBQHg2fQ234CjMgF6ixZHHxXyujUgSJb+Q5Djs=;
        b=L5R7YUDWBxKalRk0ITO9BQRK6aVvgCxwC68zvVOw91A27FJTEPmiHe5CvjLJT7IsL4
         kdhWw3ofxes8o7ua2HMJ11bt68DwCZRyjFszlm1h+++rT8vGG/KEAq5RvDtGseIa/gEJ
         a0EVPO30OhYJpPwWZX5MWz5IcJ0LMHJkxu9ZBpXvKBK9mRba15PxkA5xVrYjnGqZ0yWG
         Lrp8O22NYMyYySxvsKl6ia+ZEgrwVmIarduVg3kJ0aZBv/DifEnfpDh/Ei9zFSCaU7SA
         GFjpUqPSnkBeSW4yShBZRpXS2WMjDYpFxQIHz0MsDQ5SZ5svEo9zroFYiHtOPnD6jrT7
         b0HA==
X-Gm-Message-State: AOAM531Q0Aobwwk5N58TaMaezdEbnhpkn+ZdkwwKGpYwgHLqStBTke2p
        RRhfB6epnsBsuo36fKAZVQ==
X-Google-Smtp-Source: ABdhPJxwJtVIGcJC/9Eof0tcXkBvMbAy6LDRx8MkkwQ05jU/N4ORpjfLUk+XbSpM4BB0PSUKRW7gJA==
X-Received: by 2002:a5d:970e:: with SMTP id h14mr15891433iol.117.1589834613971;
        Mon, 18 May 2020 13:43:33 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id h10sm4327382ioe.3.2020.05.18.13.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 13:43:33 -0700 (PDT)
Received: (nullmailer pid 13972 invoked by uid 1000);
        Mon, 18 May 2020 20:43:32 -0000
Date:   Mon, 18 May 2020 14:43:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     l4stpr0gr4m@gmail.com
Cc:     trivial@kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, nsaenzjulienne@suse.de,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH] docs/devicetree/i2c: brcm,bcm2835: fix node id in example
Message-ID: <20200518204332.GA13919@bogus>
References: <1589140701-7516-1-git-send-email-l4stpr0gr4m@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589140701-7516-1-git-send-email-l4stpr0gr4m@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 11 May 2020 04:58:21 +0900,  wrote:
> From: Kangmin Park <l4stpr0gr4m@gmail.com>
> 
> This is a trivial patch to fix node id to match the reg in example.
> 
> Signed-off-by: Kangmin Park <l4stpr0gr4m@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
