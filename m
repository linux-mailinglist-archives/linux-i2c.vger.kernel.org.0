Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36FEA39E7BC
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 21:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbhFGTwL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 15:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbhFGTwK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Jun 2021 15:52:10 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6756EC061574
        for <linux-i2c@vger.kernel.org>; Mon,  7 Jun 2021 12:50:19 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id pi6-20020a17090b1e46b029015cec51d7cdso726506pjb.5
        for <linux-i2c@vger.kernel.org>; Mon, 07 Jun 2021 12:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bv74AsRhD4whW+6rqcWVyhSDnu9tbc873ZsPv5yjLt8=;
        b=NxHFgZcR46dNJ/o9M+qgeUh0XvF6NiNhJJpHiHs5QY7FL6/gzr/emWrwtCDWZQD8Dx
         my1kh1hbLPuWtutLzJpqidHG7SuIeoJVt+PT0UbDc7GdBx1Ag00iq0OdhFL17EHKQftB
         MPENPRdmcoh+l0LkQmX7PQXAw7bflg/A0cELVjJ/sslT63Avr/c3//Qq0g7RlOq9Q1i4
         tceBwT4ki79pDtX3f9O9ZnWxhxsCaxAnlakdxB1i94ucGDEzAbCDk/Faok2gXnAbDGov
         xk5ZGIIeu+Z3k3GrgC2BTW6N1FJ/Vll4YJzXE+BxmJ6Il8Cgzqn3XxOAijFueSTDIQj1
         rzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bv74AsRhD4whW+6rqcWVyhSDnu9tbc873ZsPv5yjLt8=;
        b=kLDmF4dhYmq7pyYdg+zI2xWxUU7EKDMRPnUEl6qf1UieWbB8PRM9FfOL4uylhtAorg
         LbwbQYkGhzDuOckmZK9MZEDvz4U1hVpFiq5dZIhemJD54rfwPjVYv+VlOZFVnJsMDdVM
         MdoeDSTAEjGqkuyt1/cvb3tyk+gBK6XVVoBH4pK0wvhvWw3f/Yrw9ZR8Ep0+64mzNmVA
         xAJHa7G82cQfGZJu7A0wbD9LLflwlfQoApq6H9HFxtIduh27+dbz7W5UBTVW4mkZFhaY
         GBq/ITVeCU0XcJDVUF30D0MMWnzVD13H8xLxcdGmUfa4BOCp5P4ywtKUlSb/5DCerDFP
         fQyw==
X-Gm-Message-State: AOAM532aAh2hRi2+jjwQN0HGWNHstoiUq1/BJkyXKyQ3/g18lLhR9a5G
        R/tSmCcr4AS4y0/I6F7sHZbhbGOT81RMHhslAOwe6oiWtoGhVw==
X-Google-Smtp-Source: ABdhPJyNfn1tfxkHDiti16wGlBjWWDwTONOD9MNID3zf+NVDwJNDQ5ly+dhTLIzNIaIlAeoT6OFTGxMTtfd8pWcmzN8=
X-Received: by 2002:a17:90a:b28d:: with SMTP id c13mr809342pjr.80.1623095418755;
 Mon, 07 Jun 2021 12:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210602044113.1581347-1-matt@codeconstruct.com.au> <20210602044113.1581347-4-matt@codeconstruct.com.au>
In-Reply-To: <20210602044113.1581347-4-matt@codeconstruct.com.au>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 7 Jun 2021 12:50:07 -0700
Message-ID: <CAFd5g44Hd8LbSPCs4CT=KAh-Z5jwuc9y62yVh-azbc8OU+p56A@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] i2c: aspeed: allow 255 byte block transfers
To:     Matt Johnston <matt@codeconstruct.com.au>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        jk@codeconstruct.com.au
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 1, 2021 at 9:42 PM Matt Johnston <matt@codeconstruct.com.au> wrote:
>
> Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>

Looks good to me. I have attempted much larger transfers than 255
bytes in non-SMBus mode so this should work fine.

Excited to see some of SMBus v3 support being added!

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
