Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B14F51CE8AE
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 01:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgEKXAv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 19:00:51 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33066 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgEKXAu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 May 2020 19:00:50 -0400
Received: by mail-ot1-f65.google.com with SMTP id v17so1056371ote.0;
        Mon, 11 May 2020 16:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=R2FIzGJ36G+ksaMQBrNC7rs0zXCR6DoaIq7rGb+2bfY=;
        b=d2PirHODRXMg+N/V2FKbUK5DCPqwC2+O9NYbYW+BrRvSWxq3tvmSlZkkhhExey9hg4
         zgtHMa0jkkUkBEqrynSmszNMEjIBra2Y1yDQBxfdgNOpe4fH7UralhMoy5fu/rEWZ6DY
         HfvFS2FElBPQ/gJ6Ef3kBkx3OeIMLjkIcgyjoNimjIs82VyZ7n7U85v2YWXNhvMw1avO
         ZfY57dnBuC1MGjAzR4NFOZIciOPq+vc6mt8zSh02/Jo7OauH+YGPQSqNvgQzU5VP/j74
         ZdBZUnF3l/0Q0hOECYjCJm9VLAs49FDMDfbKl3Dqr9hqhLivDhOES2xel3d1mulb6sWs
         akLA==
X-Gm-Message-State: AGi0PuYTUlCRMmTo2ejAmznhXbcZ+LpH+G9tM0ok5gm6R8iaD+JCj3oq
        lnJdXqW5gcpZhFKR69Uncw==
X-Google-Smtp-Source: APiQypLIKWVpma3ZFGFIRQeE5SgL6Vd0dRhGSpaABZzl+NCkX37DvuxFgcB65JKK/JvD6gJaUgjqhw==
X-Received: by 2002:a05:6830:1613:: with SMTP id g19mr14466894otr.284.1589238049507;
        Mon, 11 May 2020 16:00:49 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u197sm4933977oie.7.2020.05.11.16.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 16:00:49 -0700 (PDT)
Received: (nullmailer pid 11189 invoked by uid 1000);
        Mon, 11 May 2020 23:00:48 -0000
Date:   Mon, 11 May 2020 18:00:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 6/8] dt-bindings: i2c: Convert i2c-jz4780.txt to YAML
Message-ID: <20200511230048.GA11123@bogus>
References: <20200426185856.38826-1-paul@crapouillou.net>
 <20200426185856.38826-6-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426185856.38826-6-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 26 Apr 2020 20:58:54 +0200, Paul Cercueil wrote:
> Convert the i2c-jz4780.txt file to ingenic,i2c.yaml.
> 
> Two things were changed in the process:
> - the clock-frequency property can now only be set to the two values
>   that can be set by the hardware;
> - the dmas and dma-names properties are now required.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../devicetree/bindings/i2c/i2c-jz4780.txt    | 33 --------
>  .../devicetree/bindings/i2c/ingenic,i2c.yaml  | 83 +++++++++++++++++++
>  2 files changed, 83 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-jz4780.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
> 

Applied, thanks!
