Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 360CC1CE82E
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 00:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgEKWes (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 18:34:48 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34622 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgEKWes (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 May 2020 18:34:48 -0400
Received: by mail-ot1-f66.google.com with SMTP id 72so8988250otu.1;
        Mon, 11 May 2020 15:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eEYJO787L4hFdfVmppGJoURsIfu4v30oXYj733amcm8=;
        b=JcEGgm8HYb/M1fWJB7i9Q4Bg3+k6SAsMZjtDQqLHD9KWjvKt3o5jISrOtwbfRwV5WC
         1TLlMaGq/3s9ub54txzZWt5Pa0ALRn7w0TtcKRHL4hHTAQP7cU+OsYmPgVwNY8tUrO58
         Y+ZCiiV/rNw3X7cM9j0ZxEtfxfePzsGF8gMF9VwxpOLmLH+NChdW3RVpDhP5vsUIaz4l
         HoTBSIBPKorjCjXSp2do0hPKawKD8P7tq0V+oCqbpKKQBoQJFx0lO/hGaRkXHVIYeHD6
         3S2KovU7FVKSnNALN+mR/5IQO4dafoapDf87oEUEUZRyA/vU9lyJ0VVjyrE/ZwushA3S
         np1A==
X-Gm-Message-State: AGi0PuZRYm3ZNDYEKiwmry6WhOCJUl6YQlryULornBgA3K1PIjCYRNVm
        ZLM0wuZpIgKr9xLdPOFSJg==
X-Google-Smtp-Source: APiQypLtT/X05M8l7zBdEA0gsanAJHzjfh1Fbw4ZKIwZebB4QlF353Lej8+d2MpNzUXHB7tUhCMpfA==
X-Received: by 2002:a9d:6ad0:: with SMTP id m16mr13613165otq.122.1589236487268;
        Mon, 11 May 2020 15:34:47 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n23sm1231572ota.37.2020.05.11.15.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 15:34:46 -0700 (PDT)
Received: (nullmailer pid 7417 invoked by uid 1000);
        Mon, 11 May 2020 22:34:45 -0000
Date:   Mon, 11 May 2020 17:34:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-serial@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/8] dt-bindings: intc: Convert ingenic,intc.txt to YAML
Message-ID: <20200511223445.GA7357@bogus>
References: <20200426185856.38826-1-paul@crapouillou.net>
 <20200426185856.38826-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426185856.38826-2-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 26 Apr 2020 20:58:50 +0200, Paul Cercueil wrote:
> Convert the ingenic,intc.txt doc file to ingenic,intc.yaml.
> 
> Some compatible strings now require a fallback, as the controller
> generally works the same across the SoCs families.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../interrupt-controller/ingenic,intc.txt     | 28 ---------
>  .../interrupt-controller/ingenic,intc.yaml    | 63 +++++++++++++++++++
>  2 files changed, 63 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
> 

Applied, thanks!
