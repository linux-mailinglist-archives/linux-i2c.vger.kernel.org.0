Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3993BB9A7
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jul 2021 10:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbhGEI6t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jul 2021 04:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbhGEI6t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jul 2021 04:58:49 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D10C061760
        for <linux-i2c@vger.kernel.org>; Mon,  5 Jul 2021 01:56:12 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id 145so2154042pfv.0
        for <linux-i2c@vger.kernel.org>; Mon, 05 Jul 2021 01:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=al5EeP8QXH1RSq+yYN15w1dJ9cxYy0MXetYFBHF4BSo=;
        b=qxMcLlfGOx0W2JA5nKbBKobaGjC/IWWZnUhRyQ6J3/Ux38uY7SbIZQH3eWvXKiXIIQ
         gTGNHlA9cNQZVeFzOyeMFf9ipQXRGMbQSXZ2t2WUY/KqnsbKWGLA/xchnGdhv3D6T4Kh
         9M8IM1PcZRSN9uXxO5MWZqMoyms6DbbXqgdZNYKQL8DycFbVx6So919oFjhW5IIeF1lw
         jGNi7JgVNRAHGfoo4jHeLmEvz6DrG7P4icd03qbBvrWfQ4oL7/MkPb2HOE14rvSejuvZ
         4Zr6BZusasXGeBGZLwNBTKfKoaupAg9r1YazNL/uwaIq7jNc+6NYfqeLazMFVV8Dshum
         aL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=al5EeP8QXH1RSq+yYN15w1dJ9cxYy0MXetYFBHF4BSo=;
        b=Nx7fF1BiMCNt1D6LIn28TFI43AjwMem6qnheJwmrSiw8RmWxaYfvZqXmhxyHMR6kA1
         UtftLyo+geuWp78mfHdN5wgszYX956aoOPUuHA7Vtb60TTED3CbCefgRp4gjaMsj5t0K
         A4+UtBmATLC0B5nTE3r8MDDD92kM710ekiVz/jvzcODP8tWAtPxhZ192SjRnBZvw3JHu
         McWmP4473RC0vKCLvLduAw9tF8fHmyozR36668sEBzelF9ZULNDhUe1wFTluZG1bEri2
         71+TMtG+jimBIEvNN9v0LreMVKXu0KoD03Tfk8CrpSCet3VkcAIL1r1huVgKrwZpq01h
         yERQ==
X-Gm-Message-State: AOAM530kztZWcy/5uaJrgP25FOGHQmgoGnDFoHzC8Ld7SCtt5cse3EsI
        ZLrFdXk8HxStGkkxDaQJMmeyXg==
X-Google-Smtp-Source: ABdhPJyIQbG4Z5iuwB551KL53cMIMxfhI49MIvYS5ne9261aa9T6dN/WzZgpRpsdddED6oNm+/NA6w==
X-Received: by 2002:a63:4c19:: with SMTP id z25mr14586040pga.160.1625475372402;
        Mon, 05 Jul 2021 01:56:12 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id ga1sm10547756pjb.43.2021.07.05.01.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 01:56:11 -0700 (PDT)
Date:   Mon, 5 Jul 2021 14:26:10 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jie Deng <jie.deng@intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v13] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210705085610.okcvnhwhwehjiehy@vireshk-i7>
References: <8908f35a741e25a630d521e1012494e67d31ea64.1625466616.git.jie.deng@intel.com>
 <20210705080245.yabjlrgje5l7vndt@vireshk-i7>
 <CAHp75Vf0_8+KW_cp2g0V1miMx1cegBdjLzBjTbtpmcmdCHQJxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vf0_8+KW_cp2g0V1miMx1cegBdjLzBjTbtpmcmdCHQJxA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05-07-21, 11:45, Andy Shevchenko wrote:
> On Mon, Jul 5, 2021 at 11:03 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > On 05-07-21, 14:53, Jie Deng wrote:
> 
> > > +#include <linux/types.h>
> > > +#include <linux/const.h>
> >
> > Both of these need to be the uapi headers as Andy said earlier
> 
> They are already since this header _is_ UAPI,

Ahh, there is some tricky header inclusion there :)

> what you are suggesting is gonna not work,

Why ?

> although it's correct for in-kernel users of UAPI
> headers.

-- 
viresh
