Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7525A1AABC9
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 17:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506426AbgDOPVX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 11:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730523AbgDOPVT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 11:21:19 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89402C061A0C;
        Wed, 15 Apr 2020 08:21:19 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id m21so86800pff.13;
        Wed, 15 Apr 2020 08:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=TD9EaFwapyU2qSwmdAV+2CcChhngrjdNFxDFbshTLXA=;
        b=nQHhm9l0ZNDWXaN7XXaFI3qlDCdhj8NSO7ZSm5fruqQmQW35do2FunBnlQqUoynJml
         7c2e+uR7F5xBGen8y2W06zeVM+vbgiJuapzRa0i1IeesJBckwdtEsqD+gdJsKG4IZpk0
         RhNDLBLzurg6NM2ytlqjt95twMYWiOB+9A+aocJPVbXqlOBHVj+ASQlLntCHK35sAK2w
         TexAvRixKW3S11SuhrEwLARj4ngTjZxNZTXrlPR304t4pU9GUpmrTEUNshD8igo83tzB
         /QouN+mwg+vZcYCxQVOYSsC5R8EhMINpUIR67WBOFf9Ne5BXgQGkUVqXDfewT3bBo1En
         GiwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=TD9EaFwapyU2qSwmdAV+2CcChhngrjdNFxDFbshTLXA=;
        b=qWEPaqRU1Ugj5BzH914//vzFjtZdseC4S1M2WdJsGJTEclar0t9vGlDEJGZe7pA7Y8
         f17Mou/hogygHfnHBd7+pN4L9BDZxBkhYPdPyb44cEiKQnL3BcuFgHLbsG3u+WYp4Pq3
         4P9ZSN92QKeGLxBDaSkfn3ABm/7dsgvXp9k1Ed4JyhhcnwSflgSuyDaniBOWP0aqKW+F
         /iIt5yal6phVx0ngeK7bGY3QlOuDF3GlfbKAySnL4b9bc83DrS2cgh94eqaHKAHIOwvL
         NGdzNkSxSqT1uetMFLHi/agobvrHLMaLhlS7lAo8xKXm7GgFAf/W964pilkI9vuym3sQ
         KVaQ==
X-Gm-Message-State: AGi0PuZPreOx3/xJNqkgEPV/t6WelUcdxPoAhkeNqM6epofSaq77D1R5
        bfO1yjyh3K6fXa4sLkoERfY=
X-Google-Smtp-Source: APiQypJRhNbAHK0EFpWTqY0QbAfoOd1yshvCg1EAyFwL+3WmQGnMSjZt9J5Dr/nxaaynNOq/WSuEBg==
X-Received: by 2002:a63:4c1:: with SMTP id 184mr8174060pge.156.1586964078973;
        Wed, 15 Apr 2020 08:21:18 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id a129sm14160190pfb.127.2020.04.15.08.21.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Apr 2020 08:21:18 -0700 (PDT)
Date:   Wed, 15 Apr 2020 23:21:15 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Allison Randal <allison@lohutok.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        Shah Nehal-Bakulchandra <Nehal-bakulchandra.Shah@amd.com>,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: i2c: img-scb: remove duplicate dev_err()
Message-ID: <20200415152115.GA17519@nuc8i5>
References: <08564c03-3bbd-5518-1a9d-a40b8ca09f48@web.de>
 <20200415025426.GB14300@nuc8i5>
 <b5db65f5-f236-9e22-98df-07629a827738@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5db65f5-f236-9e22-98df-07629a827738@web.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 15, 2020 at 07:47:41AM +0200, Markus Elfring wrote:
> > Thanks for your comments, and maybe we can use coccinelle tools for
> > more source files do this change in the mentioned software area.
> 
> I found 19 source files (for example in the directory “drivers/i2c”
> of the software “Linux next-20200408”) which seem to contain similar
> update candidates according to a known transformation pattern.
> Would you like to take another look at corresponding change possibilities?
>
yes, I want to do it and thanks for your info.

BR,
Dejin

> Regards,
> Markus
