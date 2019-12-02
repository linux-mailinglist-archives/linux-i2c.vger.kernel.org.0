Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D335B10F345
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2019 00:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbfLBXPr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Dec 2019 18:15:47 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:33826 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbfLBXPr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Dec 2019 18:15:47 -0500
Received: by mail-oi1-f173.google.com with SMTP id l136so1471739oig.1;
        Mon, 02 Dec 2019 15:15:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=d1akBS2012TRx794NyTHGyEpjpY/8aUKIwYoBVW77Gw=;
        b=QgjjqbSVpQXjVEdLlG3kazjvqyj6/Mz8QQHSA+9iBzXkFbmAL065Lr5OJCUtdpoWUG
         P9NvLWvH/N74GSjoOQ3Z9963Q/Ta8ayVAERB05myxIcI5HBCDDnJ/zQCjHlue7/kSAp1
         mSkIweRKQb5N/dvfG40dEyFrlJf/cqk68trXkquIBEga9R3QSRA0JRZE7dpBEgIpPMSl
         6+YEiPtvG2JyVbQOncLx5lWU0kZFz+d/91xf8mQDKtjjH7yT/KYJk3RazOwTjR98UpHE
         GnHTgXNEUJJymd/qAgknEj8RJq5h8qmOwkPykt/Ula2/+t3poR7OX+upJds3MYY7W5No
         cBbw==
X-Gm-Message-State: APjAAAUFH37F13akdGzMDpnNP2QgbURvhJJysdTIVijtKFCAVesdOo4Z
        IODmcQf+5cLTnM3BTtferStyU14=
X-Google-Smtp-Source: APXvYqy9lkloJ8bqAvWOLfqbxy0xxp431Ex2SwwSuUhb4/4rZv7QPbLgSbgRSy98uh1ksYCW+Tw1mw==
X-Received: by 2002:aca:d988:: with SMTP id q130mr1243850oig.133.1575328545801;
        Mon, 02 Dec 2019 15:15:45 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j43sm365334ota.59.2019.12.02.15.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 15:15:44 -0800 (PST)
Date:   Mon, 2 Dec 2019 17:15:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biwen Li <biwen.li@nxp.com>
Cc:     peda@axentia.se, leoyang.li@nxp.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Subject: Re: [v6,1/3] dt-bindings: i2c: support property idle-state
Message-ID: <20191202231544.GA19159@bogus>
References: <20191129092222.2706-1-biwen.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191129092222.2706-1-biwen.li@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 29 Nov 2019 17:22:20 +0800, Biwen Li wrote:
> This supports property idle-state
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v6:
> 	- none
> 
> Change in v5:
> 	- none
> 
> Change in v4:
> 	- none
> 
> Change in v3:
> 	- update subject and description
> 	- add some information for property idle-state
> 
> Change in v2:
> 	- update subject and description
> 	- add property idle-state
> 
>  Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
