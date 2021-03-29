Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4C6834D7BE
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 21:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbhC2TFx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 15:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231658AbhC2TF1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Mar 2021 15:05:27 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D8EC061574;
        Mon, 29 Mar 2021 12:05:27 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id v10so5130456pfn.5;
        Mon, 29 Mar 2021 12:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3o+FkO2Qy1s5nSC7B2dEf3QkgKMMmA6C1GTPWCCkaNA=;
        b=BVBc9iD5vjN7weFys9N2KW4OZ1qrF/fi32fHRVh91yhZuZZZ9htR9QIlJYMmE2QD8J
         Rsptypg7Smz2Z8XrXQxZpXSvDAdCdl2ZiX78FAI5u6WAAEybZinLqR5ucBrio/krYCXK
         Gag73vp7pUyPe9ptgfmQYu11CS58JvEr3matYUaFzuoeqmJh/QVWQ/EG+fYJ2QJbA/t6
         EG9A5N0LChtSPQYu4LLB+rqv0+451Y7PM2SUxFI/Z3TbwMavKAj/cDIUjz6OyzsHcAzL
         JymDx5c0llAKvUhih+bg/0c8Wlb0l6vUuJCZy2gglvqOznKRQ51glakF7AyVyLA8IChi
         NKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3o+FkO2Qy1s5nSC7B2dEf3QkgKMMmA6C1GTPWCCkaNA=;
        b=gF2E5MBm5L2dYWf1RONLqgtpudABuPTryhRMbMQrSCkTqrQwRVDvXFwB1q4uPnX61Q
         4i226XWZsn1DA/XIzivrpWo9R7X3p0Y4TrmP+5AzQbYzD9oUKvY1u+asYy2M5zLeyj/c
         Bxh84BgXtlNqRgauKZkzl/OXl8Dq4Hukc4sfl0aGqxU/tQiVY/yd3yE3nor8zshDBwD4
         gK7TxOU828DbKOArm+ZExbLZ6b2snyzG8rZU0VKwzmOYvegD/AytwC0yelZ1lOP5FjoE
         5v7ikBp8zlDfd12fa/6x/zRaeQcq3TrYkRGEtneocm8kDx+9QVJi5sR43uzE4dagSMUW
         XfKw==
X-Gm-Message-State: AOAM533GoGs+5GHZrx+rP60KtT5vg5ZZn/JrjpqJ9e0pd0FO+sqLz5Yc
        IZbuLi/aiUod2SYe7eNR2ms=
X-Google-Smtp-Source: ABdhPJy3kJUbM4NI+kqqkd721+NPv874JhLidNgm/a5xMR9JIW52UJW/Higxtt+Xaxtwh+MYq7JtKg==
X-Received: by 2002:a62:e10f:0:b029:1f5:42b6:7113 with SMTP id q15-20020a62e10f0000b02901f542b67113mr27123737pfh.63.1617044726848;
        Mon, 29 Mar 2021 12:05:26 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a82a:a913:988c:7480])
        by smtp.gmail.com with ESMTPSA id g18sm17793351pfb.178.2021.03.29.12.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 12:05:25 -0700 (PDT)
Date:   Mon, 29 Mar 2021 12:05:23 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/12] Input: elantech - Prepare a complete software node
 for the device
Message-ID: <YGIk8+vw01rdVAVx@google.com>
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
 <20210329105047.51033-12-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329105047.51033-12-heikki.krogerus@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 29, 2021 at 01:50:46PM +0300, Heikki Krogerus wrote:
> Creating a software node and supplying that for the device
> instead of only the device properties in it. A software
> node was always created in any case to hold the additional
> device properties, so this change does not have any real
> effect.
> 
> This change makes it possible to remove support for the
> problematic "dangling" device properties from i2c subsystem,
> i.e. the "properties" member from struct i2c_board_info. The
> problems caused by them are not related to this driver.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
