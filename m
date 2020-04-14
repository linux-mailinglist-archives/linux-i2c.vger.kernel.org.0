Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B16BD1A8529
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Apr 2020 18:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391821AbgDNQgi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Apr 2020 12:36:38 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33325 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391796AbgDNQg3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Apr 2020 12:36:29 -0400
Received: by mail-ot1-f67.google.com with SMTP id j26so36609ots.0;
        Tue, 14 Apr 2020 09:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5JeNccLd8aWL/q2I0Uphl5Xh3ywOX9/yfdTm/7l6/XI=;
        b=uhGEl3QaDdylE6INW94LRrwZD+ffWE8ptmrtf8y/bdFhV6OL+j4TTqNdhtxwODVshL
         r6X9V0+HUjdr1XtVv/gctDss7zcp4MRv1vAnTZE0W+wKukuUPeZrF17E4M00KhRa27km
         TQrd6/Ea0ofqkoAG7wUJylRLnRlfzeYnU3RaJweTPQN41kNEla2ZwpvtUbzi9axZIu8M
         77w41zk9DCb0kh0mhw3T/GCPt+DKy0JrfDArWttPwiIHml6db/MqWcbEWWo4bUyYQMq2
         2S9S2MVnfwcw97BVwB2IbveMW9u9Cd+1CWqRKmRbX8yrPgRL6HCKT8GR8hdzItAAg2kN
         kgbA==
X-Gm-Message-State: AGi0Pua2oYf2BSNE+0zx3OWxnO2xiJoBdxa7UP1h7PRkhXnEYUtdqk0T
        /jmpVzw2FWdxPS32QBxkjH5cA/w=
X-Google-Smtp-Source: APiQypLvmzuIr2B3MuICj58NF+sqsPGPZR1D382m0X0wuXwjQvpVcD5kduqQRrGmHS7qQc+zq4tyHQ==
X-Received: by 2002:a9d:58c:: with SMTP id 12mr19943668otd.156.1586882188166;
        Tue, 14 Apr 2020 09:36:28 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l188sm5726102oib.44.2020.04.14.09.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 09:36:27 -0700 (PDT)
Received: (nullmailer pid 32342 invoked by uid 1000);
        Tue, 14 Apr 2020 16:36:26 -0000
Date:   Tue, 14 Apr 2020 11:36:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc:     devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: Re: [PATCH] dt-bindings: i2c: cadence: Migrate i2c-cadence
 documentation to YAML
Message-ID: <20200414163626.GA27722@bogus>
References: <20200401134222.60317-1-iwamatsu@nigauri.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401134222.60317-1-iwamatsu@nigauri.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed,  1 Apr 2020 22:42:22 +0900, Nobuhiro Iwamatsu wrote:
> The document was migrated to YAML format and renamed cdns,i2c-r1p10.yaml
> 
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> ---
>  .../bindings/i2c/cdns,i2c-r1p10.yaml          | 58 +++++++++++++++++++
>  .../devicetree/bindings/i2c/i2c-cadence.txt   | 28 ---------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 59 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-cadence.txt
> 

Applied, thanks.

Rob
