Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43B563EA5C5
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Aug 2021 15:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237129AbhHLNhZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Aug 2021 09:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233260AbhHLNhZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Aug 2021 09:37:25 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 342B6C061756;
        Thu, 12 Aug 2021 06:36:59 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id e13-20020a9d63cd0000b02904fa42f9d275so7772324otl.1;
        Thu, 12 Aug 2021 06:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=lxEYcLoSmKcwAqq6lEWUTNh1J0BSQ5RJ+tPc70kIvv8=;
        b=N+l05ozxyD1NG1dkZUngFULf3v7jhRSbnR3bHLqfiz9dby07s+mONwlfvcPK0q4TpC
         7TiWQGQOBdoF1zE3c/2Gu2F+K4pOTl/yJy7prAkKAgeKH9paMe+57QeOsB1Sw8iBuDgf
         Bg7Lnbtyiqb+chBrZwjK1IQMznYfVvO7//56Eb19UoWrGfVEesfIKpwXICsLwFDGNkOT
         LBXWVs6EteP/0VimsFRXf7DXL7R4RVLFWiIewc/ERmTBNu76kb7rS5cQ+lxfBSfozlXq
         mhnZAoTGxU5l0sh9IM0Vh4vNMDkUmbcaFnAZsSxbEemP4+e0WlFJJyZTB9PmygkiPE6E
         BNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=lxEYcLoSmKcwAqq6lEWUTNh1J0BSQ5RJ+tPc70kIvv8=;
        b=c2GMvXlR+NPe0arf2wBqdbfN0p7Si6KcNaI+n1eDYLTdNvqL1oeDsco3CHgNczU3WJ
         awkIfBhxsWNbwYnOVG/UBPtCGN8vKweyaekKcfN9zsqRMwtk26GNzTSXdLwkseBDBG6v
         bgr4tx4ZQPckfoY5hM17+e4jFYgwEDuj8FOGLhhqbqC4bGV1K13dtQzny/Su0kooTaEY
         4sODyt8M+M8WEmrxTN2Z95nV+cKFtgq2GyRPGDt26WPnJzNYrLgvZSEKCsY536cq3vK6
         PBnEOwqstZ7BOMt4YhbZXr/lLU30RAILK2wYZT+8m39WX0ogIQ230N87ITDqoRaGRjL3
         gmXQ==
X-Gm-Message-State: AOAM531yKqupX1IKQFco+95/3UgygzzPQNIm69NFNRDceAak+vW5+XGI
        wYohEarxv35iOs1matKFjA==
X-Google-Smtp-Source: ABdhPJwSEJIsmvBs2Ju7id/07iwZC6CGzdrHno0A3fxPpp0tLpTJfwR7oTj/F4lF6MngczX5vwnTPg==
X-Received: by 2002:a05:6830:90f:: with SMTP id v15mr3478948ott.202.1628775418413;
        Thu, 12 Aug 2021 06:36:58 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
        by smtp.gmail.com with ESMTPSA id r16sm605716otu.26.2021.08.12.06.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 06:36:57 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:39aa:3f67:e568:698d])
        by serve.minyard.net (Postfix) with ESMTPSA id 4F1F1180058;
        Thu, 12 Aug 2021 13:36:56 +0000 (UTC)
Date:   Thu, 12 Aug 2021 08:36:55 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Quan Nguyen <quan@os.amperecomputing.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [Openipmi-developer] [PATCH v5 1/3] i2c: aspeed: Add
 slave_enable() to toggle slave mode
Message-ID: <20210812133655.GT3406@minyard.net>
Reply-To: minyard@acm.org
References: <20210714033833.11640-1-quan@os.amperecomputing.com>
 <20210714033833.11640-2-quan@os.amperecomputing.com>
 <YRTQP9sX0hkTJMTx@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRTQP9sX0hkTJMTx@shikoro>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 12, 2021 at 09:39:43AM +0200, Wolfram Sang wrote:
> Hi all,
> 
> On Wed, Jul 14, 2021 at 10:38:31AM +0700, Quan Nguyen wrote:
> > Slave needs time to prepare the response data before Master could
> > enquiry via read transaction. However, there is no mechanism for
> > i2c-aspeed Slave to notify Master that it needs more time to process
> > and this make Master side to time out when trying to get the response.
> > 
> > This commit introduces the slave_enable() callback in struct
> > i2c_algorithm for Slave to temporary stop the Slave mode while working
> > on the response and re-enable the Slave when response data ready.
> 
> Sorry that I couldn't chime in earlier, but NAK!
> 
> >  include/linux/i2c.h             |  2 ++
> 
> @Corey: Please do not change this file without my ACK. It is not a
> trivial change but an API extenstion and that should really be acked by
> the subsystem maintainer, in this case me. I was really surprised to see
> this in linux-next already.

I am sorry, I'll pull it out.

-corey

> 
> @all: Plus, I neither like the API (because it doesn't look generic to
> me but mostly handling one issue needed here) nor do I fully understand
> the use case. Normally, when a read is requested and the backend needs
> time to deliver the data, the hardware should stretch the SCL clock
> until some data register is finally written to. If it doesn't do it for
> whatever reason, this is a quirky hardware in my book and needs handling
> in the driver only. So, what is special with this HW? Can't we solve it
> differently?
> 
> All the best,
> 
>    Wolfram
> 




> _______________________________________________
> Openipmi-developer mailing list
> Openipmi-developer@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/openipmi-developer

