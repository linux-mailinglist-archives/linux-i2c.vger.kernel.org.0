Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5DE82C88A7
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 16:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgK3PzG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 10:55:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgK3PzG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 10:55:06 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F38C0613CF;
        Mon, 30 Nov 2020 07:54:26 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id hk16so1621124pjb.4;
        Mon, 30 Nov 2020 07:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zesD9faGXKfbEuXEqSCTj0ccUc65wmLW/4/yHQTzcz8=;
        b=gwYbeeA/XiuwxzFx62fUnO9bSA3njd22Bk5f9nyDO0zFjG/1lX6PErcP1PbdLqERs5
         EwycBG4MhmVMVJ1pkUwfgfDyiW2ObtOKz0UK2P2yKnu0WXJq+SrR+VH+6hHe9bo1gaXv
         PTYHbtuCmLx67iyaBJBYv+Hgnc6KoPyPUrx/RllA5pZEsKHaoguDtR8vl2T7b4nuzIJ8
         j57dmNdquJ2l9RFQhN8EiQQThACmStIGPefWhR/3unU94ojTuAE9O9zISvWVrSgp7gvu
         WxgxPfwJFWhOIw6sL8i+CqfiHixuMKuV3W/sdGguLzgUACWFZaJVAI1KYPNGApjAJ9ey
         05YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zesD9faGXKfbEuXEqSCTj0ccUc65wmLW/4/yHQTzcz8=;
        b=hZnD4aoWCdYu3e8eRKipJFLdkjdI6D69HlxxdFg8N906so7hEdE8rxQL2ZibyvZA8L
         mEnVtMjOJUGzQsncRICLnRuIbJVCZaLzWW99BRviypoqr/SNR8HZX9Ya+mrGyq0/01Wi
         jr15ggGM3MxBlgbSykYi8U2Wo9cuE29zziOJkgqQA9hgs9mH7enPkAeIBpO+hsizoK+q
         Nm0XXz1zRQlnzPNrWewD7+DkhelhlpGrGFVUdmV7/OGhtupL6VdGpYRuUfA+2IAa3iMu
         /CxWHqJ+h3mUJJg39yLOMvdbEdqehhgO05NJS66xrHBWpzs3N7gmNaSjXXGbWt05nm92
         RsiQ==
X-Gm-Message-State: AOAM531FKvZy53KB5uppNZAPDuuQF//FjsAJv5iGdHFKsJNAhx4fcy3C
        pCmrFoRqnvSvFOnwF95Wd7A=
X-Google-Smtp-Source: ABdhPJw9nK9xTTC0/xCOmca/W25LMh0JxHZQy60vyo5NUBN4yAzs3Zy2VHby6qJ9oEAy2hb8rSavcg==
X-Received: by 2002:a17:90a:6346:: with SMTP id v6mr27184285pjs.162.1606751665709;
        Mon, 30 Nov 2020 07:54:25 -0800 (PST)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id 204sm17331660pfy.59.2020.11.30.07.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 07:54:24 -0800 (PST)
Date:   Tue, 1 Dec 2020 00:54:22 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 08/18] lib/test_printf.c: Use helper function to unwind
 array of software_nodes
Message-ID: <X8UVroTsTYqp2R1M@jagdpanzerIV.localdomain>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-9-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130133129.1024662-9-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On (20/11/30 13:31), Daniel Scally wrote:
> 
> Use the software_node_unregister_nodes() helper function to unwind this
> array in a cleaner way.
> 
> Acked-by: Petr Mladek <pmladek@suse.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

Reviewed-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

	-ss
