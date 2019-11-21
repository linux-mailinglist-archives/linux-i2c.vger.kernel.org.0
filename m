Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37FE5105A81
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2019 20:39:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbfKUTjc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Nov 2019 14:39:32 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36171 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbfKUTjc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Nov 2019 14:39:32 -0500
Received: by mail-oi1-f195.google.com with SMTP id j7so4330038oib.3;
        Thu, 21 Nov 2019 11:39:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=c4KjpD+ns0ACXFE5v6l81aoQVHuHJsxlS4JefMC5EMY=;
        b=CE49zIfQ1Fq8wUnUj/AAwpB/UTdeb++Z1Ad1f8tWJGWazHg1369dTQ4I8ZXg3Jt4sd
         bA4VUgkIQfyr01XMzjZxEpTYJ/khoRB6e0iiltPTf3YViG+m1oikNJSEGtubLG5Gq4Mx
         ErI6ipMjg+KlEK9paGek6hdgB9eVwuIYO6RbLvCZrCHRcEs4qozuLhyGAwXzuF33TrTC
         ga18j6Y8UmqO9uFjTRnU2pSSYNhCtrGSgs24vn2e+aKWs1NcoQhiVmY+nQZc1OLwxWCQ
         4GaGvsgJaiogMNm7rPHq/xnoEMeT0lU1zcM0Y3qy+1dne0XIFL3P2HWT3YjldRxcCpgM
         plAg==
X-Gm-Message-State: APjAAAUboo/L8iiR5l0lMbXT8XIis5bFLm8pH4QidIXQqjAe4LJjEWjC
        Eh4hkLXUCIm86JUeklYA6w==
X-Google-Smtp-Source: APXvYqw+O/5gVYMGrcCumNOlMYDrrdD4XmwLhJA1mxJFW4xVlHhGW1dwTOU1ghWvK2UUGvx0UeKwSA==
X-Received: by 2002:aca:1715:: with SMTP id j21mr8631035oii.6.1574365171174;
        Thu, 21 Nov 2019 11:39:31 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u204sm1229289oig.35.2019.11.21.11.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 11:39:30 -0800 (PST)
Date:   Thu, 21 Nov 2019 13:39:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH v2] dt-bindings: i2c: stm32: Migrate i2c-stm32
 documentation to yaml
Message-ID: <20191121193929.GA6676@bogus>
References: <1574342866-8348-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574342866-8348-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 21 Nov 2019 14:27:46 +0100, Alain Volmat wrote:
> The document was migrated to Yaml format and renamed st,stm32-i2c.yaml
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
> v2: remove i2c-scl.*time description, ref (moved into i2c-controller.yaml
>     push the st,syscfg-fmt into the if compatible st,stm32f7 part
>     fix the st,syscfg-fmt ref syntax and set minItems/maxItems to 3
>     make the clock-frequency part common and only keep enum in the st,stm32f4 case
>     remove unnecesary minItems/maxItems
>     remove address-cells/size-cells from required fields
> ---
>  .../devicetree/bindings/i2c/i2c-stm32.txt          |  65 ----------
>  .../devicetree/bindings/i2c/st,stm32-i2c.yaml      | 141 +++++++++++++++++++++
>  2 files changed, 141 insertions(+), 65 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-stm32.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> 

Applied, thanks.

Rob
