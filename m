Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D87C497277
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jan 2022 16:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237534AbiAWP2W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Jan 2022 10:28:22 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:43949 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237531AbiAWP2W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 Jan 2022 10:28:22 -0500
Received: by mail-oi1-f169.google.com with SMTP id p203so5092892oih.10;
        Sun, 23 Jan 2022 07:28:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wsiAStu9IgyzI4AofDG0nGMZiW+bQY2RM1p3GqHWqg4=;
        b=Fe1C24oU3BGwPu8iuwgqaZKOVONB93U2YNVuLkxVZaNn+U+yzFCMme0IZbwrEsUZ1W
         p95Zcg/Dfw5wh2h1+/q0jNyIf0H198d8+rh0x/lvmFAzJkpTSvZelct9aWiafEt8d/gB
         ZP3oD3Q1JuHNqrzlBwylD8y4eftIg8+5J0jx2/5Vyqv8bur7GN8b5unEY9fwrCNxHF12
         9pPrZzAPZxM8ic0ZHXhGOrguknDAFxpVPkD1tu0QbbzT3Cu//tIO/Mk8LtdAIwpJiN4S
         dRwTFWfNl0V0Yss7H3M4tKcijy+/mTOMhFsfBSUcOD71OzvdLN2PC++BOHh/76zfs/sb
         I7Dw==
X-Gm-Message-State: AOAM531uiXtBfBDcAb9ybl1wTG0J1tRgh7/5nZZSqhNSxGn8pYWYb2r+
        E/M0n1+PMmrpcWZ+POw1RRP5jHYa6Q==
X-Google-Smtp-Source: ABdhPJz/gKnbn/p+Milvy9Y6rI+JmbGplh7DWfz9ckidpdumoS5JtSZFB8e6fcqHXR4Fi7eoKEUrpw==
X-Received: by 2002:a05:6808:aba:: with SMTP id r26mr6944865oij.155.1642951701550;
        Sun, 23 Jan 2022 07:28:21 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id t20sm2997851oov.35.2022.01.23.07.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 07:28:20 -0800 (PST)
Received: (nullmailer pid 1426984 invoked by uid 1000);
        Sun, 23 Jan 2022 15:28:19 -0000
Date:   Sun, 23 Jan 2022 09:28:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: mpc: Make each example a separate entry
Message-ID: <Ye10E8x9aS5yxyuA@robh.at.kernel.org>
References: <20220119015234.2436754-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119015234.2436754-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 18 Jan 2022 19:52:34 -0600, Rob Herring wrote:
> Each independent example should be a separate entry. This allows for
> 'interrupts' to have different cell sizes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mpc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!
