Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE2A81254D5
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2019 22:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbfLRVhz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Dec 2019 16:37:55 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:36428 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbfLRVhz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Dec 2019 16:37:55 -0500
Received: by mail-oi1-f196.google.com with SMTP id c16so1990654oic.3;
        Wed, 18 Dec 2019 13:37:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:content-language
         :user-agent;
        bh=yEtBoa+NbXgGhZ+Me2AAaq3SAEvp18ZnsJATYEa97sE=;
        b=cBYSzoFkxLUP6gq5RS/yYrhQA36YsETACfZBAsQpI8ks+ApvLlMJG9SZpKsGUoIFtD
         NU3ElSmnClkhYPsJjCWw1gpvnWapvOo7+r3xqR3hhLruwvvk6E1hM3PF/3A5Aq5sCgpS
         nPix9KT4o71lwOkX0LMoVGBnzIA7deD5+odPdorQ1/XZ3ZDfxuhvoL8nj8j63n4kLcC/
         FuJ83RqRFCTatjjE+pXDprhkblypy/h6Ltny1PlFlVlqYT8bYsKlBxbSvEDkk0RD5KjW
         vJ0ly2ZdKKKcZv2I1dBlZ27muw59NqpKreB59EqyAVrgl0MCCPw08EEhbzY2LIGPSVfN
         e9tw==
X-Gm-Message-State: APjAAAWT8Itl3SqYkCc7ZcbPx8Q9AGUvUMs80ZWZYN5vtGDWKxyoi6FT
        RBF+YtH215ioftkN31clHQ==
X-Google-Smtp-Source: APXvYqxNSk4ALCdRyx77djLgIoNn1IrtxlwEa7+9VvcHBjdabCjgJOvJKKwGqs6GqX4lDbU1YdLFxw==
X-Received: by 2002:aca:5e04:: with SMTP id s4mr1550915oib.117.1576705074631;
        Wed, 18 Dec 2019 13:37:54 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v200sm1248153oie.35.2019.12.18.13.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 13:37:54 -0800 (PST)
Date:   Wed, 18 Dec 2019 15:37:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Eugen.Hristev@microchip.com
Cc:     robh@kernel.org, Ludovic.Desroches@microchip.com,
        wsa@the-dreams.de, peda@axentia.se, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Codrin.Ciubotariu@microchip.com,
        Eugen.Hristev@microchip.com
Subject: Re: [PATCH v3 4/4] dt-bindings: i2c: at91: fix i2c-sda-hold-time-ns
  documentation for sam9x60
Message-ID: <20191218213753.GA31975@bogus>
References: <1575886763-19089-1-git-send-email-eugen.hristev@microchip.com>
 <1575886763-19089-4-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1575886763-19089-4-git-send-email-eugen.hristev@microchip.com>
Content-Language: en-US
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 9 Dec 2019 10:20:07 +0000, <Eugen.Hristev@microchip.com> wrote:
> 
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> SAM9X60 also supports i2c-sda-hold-time-ns. Fix the documentation accordingly.
> 
> Fixes: 2034e3f4c9a5 ("dt-bindings: i2c: at91: add new compatible")
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> Changes in v3:
> - new patch
> 
>  Documentation/devicetree/bindings/i2c/i2c-at91.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
