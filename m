Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2AD8123DE
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2019 23:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbfEBVHb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 May 2019 17:07:31 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46658 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfEBVHb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 May 2019 17:07:31 -0400
Received: by mail-ot1-f68.google.com with SMTP id 77so3421250otu.13;
        Thu, 02 May 2019 14:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Obuf5qyX6CajeeftWl43YvfiHOhkexQ4ZWmFLo5kxC4=;
        b=MGKW9S5T3u9PeIyayz1eBiPEvbJoIrUWnqkFSCOWrtmxJLIAXp+xJS9ON7yj7jF20f
         H8zniAf3r+TONBNrdzU1Mg5MuuLeUrP3iBtrTVE6f0Ca7VQYqwKFQlO9ml1ig7bcml6l
         oytf4HZ0XUvFSZIsRRA7j6v2oh0k7v99ijwI+W9vGWjOHkF4gZvM3pdrXp+uexcfSXKZ
         tQJQIAGGoYJztWGb7JQBWmX4vRdNlAYKKgcPWh091vCP5wTOQ3ydTf+e7i2Fmlj0tnM1
         DpMT6C7NfjlZ7LBUv6qF6Cq9IvXiNifd/XL1RIaGZ+ypH1QmSrp0yjn+o6WZTz/eHe+s
         ftNA==
X-Gm-Message-State: APjAAAVU0CHKjPeFpTNAtjO6eA4Zr91SGcbtYA5Kj1F7ER2DxLw6/gyC
        19lMyYjCCHl1mpSgi7/lpw==
X-Google-Smtp-Source: APXvYqwzY9DthBC1o8kD7qfujr4W8vud7ywuAIdAaWx053P6Wp28eq0EKI/IMavMPdHDZvxetuR3VA==
X-Received: by 2002:a05:6830:20c4:: with SMTP id z4mr1657790otq.27.1556831250474;
        Thu, 02 May 2019 14:07:30 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q26sm23285otk.74.2019.05.02.14.07.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2019 14:07:29 -0700 (PDT)
Date:   Thu, 2 May 2019 16:07:29 -0500
From:   Rob Herring <robh@kernel.org>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: Re: [PATCH 3/7] dt-bindings: i2c: riic: document r7s9210 support
Message-ID: <20190502210729.GA10850@bogus>
References: <20190430132309.12473-1-chris.brandt@renesas.com>
 <20190430132309.12473-4-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430132309.12473-4-chris.brandt@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 30 Apr 2019 08:23:05 -0500, Chris Brandt wrote:
> Document support for the R7S9210 (RZ/A2) SoC. Also explicitly document
> bindings for the R7S72100 (RZ/A1) SoC.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-riic.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
