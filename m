Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6FF3C7B7E
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jul 2021 04:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237382AbhGNCNg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 22:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbhGNCNf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jul 2021 22:13:35 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FBFFC0613E9
        for <linux-i2c@vger.kernel.org>; Tue, 13 Jul 2021 19:10:45 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id p4-20020a17090a9304b029016f3020d867so595296pjo.3
        for <linux-i2c@vger.kernel.org>; Tue, 13 Jul 2021 19:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gXlJL7ra5SyqPc0iG65gvOPT5c5xzf36xPc1PPpU1xY=;
        b=F44tQNhiaOYkkT64bIFSQ15xn18NX3ZfkXEA567D5eUlr5qmw25qfBkbNJKOZ1RtAM
         yUBzdpKghrVkyIHV1OYVWpAfwo8fBhg2jURAXuaituq8YdIvRmlv/0t2Oliqn/igY16U
         JiERsoTKqcV1cZ1sDBwgOCsYJV8PM697hA6GVnMrRnUQX6w6h5qZCNfTbbkWiRDbd+FF
         Uln4V228uHEGOGc0mlBt1/QA3zpKeqQvgCDFdo2V+gd5K5Tcv0PkkruoFMZOMfSdBUgM
         nTFIgMZ6opatBceDhhzvrXYkaRa6rEZuPpQhY9/f2Faj2Q2zo4qnL1/EHZwxaXcUVHQC
         R2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gXlJL7ra5SyqPc0iG65gvOPT5c5xzf36xPc1PPpU1xY=;
        b=lle9IVCxkeA26Z0VfPlOpAr6kWdE+1vKSNWnyyXEveRrMRgYqMnuSOPzc9QFJECmGz
         HRGJgcB5qzOyrwLxel/w7H3WDc2IIn0x+DJ0gF0ayUiZEOwu3c1amitWncXE75Dce8th
         9qW+Ton+vc5a/wSMRJzkiWExKuUWoPS1kxQhWjKSK1tfvGksYfxA5w/zEFI7uxKlyVie
         YrM9x944ZH9ZP+gjoyt1e85ifBztkJmk5RPU/iHB+5tUvKOywTGg9ugOe2IRy3wP4O6A
         MJmFTThIZVQCgJm8h8bTuAWJqdqaQ6GqS0oLndUcgdyHL28pljDSdMgmU4nYpweX0Ht3
         ZSbQ==
X-Gm-Message-State: AOAM5301f70trJukD7slQtB31EsU4xuDrl98xeafKBr3Us4K28jK8xWl
        Zflk9956cADelYGhwYiJHl+iag==
X-Google-Smtp-Source: ABdhPJzJRksFxhnqpVSkwr6RMFocOpadjnvHZAefwMJ4xF9fIEpb5BbiiuDCxaKGDcyYOFGTwhuy9Q==
X-Received: by 2002:a17:90a:600d:: with SMTP id y13mr1304985pji.14.1626228644619;
        Tue, 13 Jul 2021 19:10:44 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id mz6sm414071pjb.38.2021.07.13.19.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 19:10:44 -0700 (PDT)
Date:   Wed, 14 Jul 2021 07:40:42 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH v14] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210714021042.56hnr73wzrie3jzj@vireshk-i7>
References: <984ebecaf697058eb73389ed14ead9dd6d38fb53.1625796246.git.jie.deng@intel.com>
 <20210713113607-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210713113607-mutt-send-email-mst@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 13-07-21, 11:38, Michael S. Tsirkin wrote:
> I think we should tweak this such that we add multiple buffers but
> only make them visible to host after all add commands were successful.
> With split this is possible by deffering avail idx update,
> with packed by deferring update of the avail bit in the descriptor.
> I'll write a patch to add an API like that to virtio, then we
> can switch to that.

That will be great, exactly what we wanted but didn't ask for :)

-- 
viresh
