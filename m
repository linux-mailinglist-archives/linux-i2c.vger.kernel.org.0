Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC42419ED6
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Sep 2021 21:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236180AbhI0TE2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Sep 2021 15:04:28 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:34693 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236225AbhI0TE0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Sep 2021 15:04:26 -0400
Received: by mail-ot1-f46.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so20072362otb.1;
        Mon, 27 Sep 2021 12:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ecI1ixxbKoKDjkuufNK1un3yapogUK+2LTUIo0suHRo=;
        b=uy6AnneKjSvgKW/6uydQk0vRfbpWSR9lR3VoxD0et1B1JaOg+fpziWpPi7bdtBkNgx
         2JERm312576fRPjgCmRNEX6nmXjnPX5QrhsLCVaSZHCKqwb4qv8za5tVnuaqkNfpjXo6
         yjzb4ZV2f3uFOFPXhjbreiwPbA8BylanCRJXdNCTNZ8vjylY60ck1+LDuGCCuKdL7tja
         8qSvFvNMgX4/tJmnou32n+h4/QILgClynEWTzkWBaGN5p4KCXtt1Rtby2+e795JqJijB
         o529BZJ7qyu3B3Zh1Te02MDB9HconW1a4I9r3j6V4SZK9ls4Dbwp1K+par34r5CW4s7i
         QhIw==
X-Gm-Message-State: AOAM533ErCcXhG3GCj8FHSdiTtQPnoQZ6lCo/xXmsl2yJ7muAMATAZFO
        wvT7c3GcBzz0AhyoYoqiRI25C/LZdw==
X-Google-Smtp-Source: ABdhPJzWI4YFPrUorXsb67HfNc56meek1ROVVXpyhfeQT8tGHPkCoXTpWYrYRcBY1lsmuVqMUoutVw==
X-Received: by 2002:a05:6830:11c7:: with SMTP id v7mr1359183otq.355.1632769368132;
        Mon, 27 Sep 2021 12:02:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id w1sm4181986ote.41.2021.09.27.12.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 12:02:47 -0700 (PDT)
Received: (nullmailer pid 3672458 invoked by uid 1000);
        Mon, 27 Sep 2021 19:02:46 -0000
Date:   Mon, 27 Sep 2021 14:02:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Matt Johnston <matt@codeconstruct.com.au>
Cc:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jeremy Kerr <jk@codeconstruct.com.au>
Subject: Re: [PATCH v4] dt-bindings: net: New binding mctp-i2c-controller
Message-ID: <YVIVVkgGtlXBVizP@robh.at.kernel.org>
References: <20210923033406.3166902-1-matt@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210923033406.3166902-1-matt@codeconstruct.com.au>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 23 Sep 2021 11:34:06 +0800, Matt Johnston wrote:
> Used to define a local endpoint to communicate with MCTP peripherals
> attached to an I2C bus. This I2C endpoint can communicate with remote
> MCTP devices on the I2C bus.
> 
> In the example I2C topology below (matching the second yaml example) we
> have MCTP devices on busses i2c1 and i2c6. MCTP-supporting busses are
> indicated by the 'mctp-controller' DT property on an I2C bus node.
> 
> A mctp-i2c-controller I2C client DT node is placed at the top of the
> mux topology, since only the root I2C adapter will support I2C slave
> functionality.
>                                                .-------.
>                                                |eeprom |
>     .------------.     .------.               /'-------'
>     | adapter    |     | mux  --@0,i2c5------'
>     | i2c1       ----.*|      --@1,i2c6--.--.
>     |............|    \'------'           \  \  .........
>     | mctp-i2c-  |     \                   \  \ .mctpB  .
>     | controller |      \                   \  '.0x30   .
>     |            |       \  .........        \  '.......'
>     | 0x50       |        \ .mctpA  .         \ .........
>     '------------'         '.0x1d   .          '.mctpC  .
>                             '.......'          '.0x31   .
>                                                 '.......'
> (mctpX boxes above are remote MCTP devices not included in the DT at
> present, they can be hotplugged/probed at runtime. A DT binding for
> specific fixed MCTP devices could be added later if required)
> 
> Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
> ---
> 
> Changes:
> 
> v3->v4:
> Formatting and YAML syntax fixes, rename .yaml file to match
> 
> v2->v3:
> Change the MCTP indicator to being a property on the I2C bus node.
> 
> Thanks,
> Matt
> 
>  Documentation/devicetree/bindings/i2c/i2c.txt |  4 +
>  .../bindings/net/mctp-i2c-controller.yaml     | 92 +++++++++++++++++++
>  2 files changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/mctp-i2c-controller.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
