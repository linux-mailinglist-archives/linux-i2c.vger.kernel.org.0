Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4527BBA34F
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Sep 2019 19:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388136AbfIVRJO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 Sep 2019 13:09:14 -0400
Received: from mail-pf1-f182.google.com ([209.85.210.182]:37977 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387562AbfIVRJO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 Sep 2019 13:09:14 -0400
Received: by mail-pf1-f182.google.com with SMTP id h195so7535805pfe.5;
        Sun, 22 Sep 2019 10:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hHobqoGYvKr31jIojYx1ULHBxGJ4jtH7umzyrIjmR8E=;
        b=TuDpW8wz6k1OfD/frjG7tOMCfMmyD6VrI0Zql2fjLaLljB6TcAcKYPgw/iB9W8WQ4l
         gsBV961/JYmIYlF0XhdjGcAwpNqHDYcsF2D43efp7Gb5xBwe5H1Hp2SKVK3HRvQLx9cH
         SJ7TrB19gt4XwBgRJkwvcVPoTbyCd4Ts1u5SAaTorXbhwVtCj6h79UJautimw1UXOTF6
         Xzmc7DFRxyJYo4HuO0nZyiTP1ZwxTm5076chBkMWUfw5xjhPe7cUKbyBhKXCXxA0M/tA
         rntmZflAv3gLkTNB7YnTpUN6/ax8k0Lz5RA2weO7YYYykkbGeqNf7tqLeI6gaQ6DzFTQ
         b7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hHobqoGYvKr31jIojYx1ULHBxGJ4jtH7umzyrIjmR8E=;
        b=AWDWv5/eor8iXPeoAoqT7KpdtLZhMQZVb9zR6s3rdgrnWeQ+++w+MFeacaXfrEkD77
         hQ9aVCTfr+K8jCR3eYG9NRgDas4n+J3tIjNEk7JI/CYmevZanizZLtbzWOQcN5jtyz3o
         GX5vxKvZNlWCDVrQPkcC4cU1qfDSL4vajZQW6l7bYwdBdOX6W41E5q28a0oCypCSDqLF
         ntvr+IltKHFs7kFO10/TLLa5lDyiOc9IZft+/EtLjMEgmZ8VLLTAa5oPP/RKzpJXOA8B
         VfnwUHH3/aS8aNCYJY/vTXFpYa0swPlVEFNXGpBsmYHwXwS8qrg0IF3jOfmR9mkXKWre
         UN6Q==
X-Gm-Message-State: APjAAAU6j/4IALzlNM3vN1aY0mLLGeM5JM8NGuPBf6hbm8finzv9amVo
        mIg4kUISOkgJLO4/PqnXKUA=
X-Google-Smtp-Source: APXvYqyTEabIP7SvDyQkFpy3GvV5Sk50KOc3Uj67J+U2y/TqWXh8/bAaWsPcumRo+Xbh/mAuxkflsg==
X-Received: by 2002:a17:90a:ba94:: with SMTP id t20mr16733037pjr.8.1569172152908;
        Sun, 22 Sep 2019 10:09:12 -0700 (PDT)
Received: from SD ([2409:4041:2e8b:6e6f:acd5:5ade:157f:5f8f])
        by smtp.gmail.com with ESMTPSA id j25sm5308411pfi.113.2019.09.22.10.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2019 10:09:12 -0700 (PDT)
Date:   Sun, 22 Sep 2019 22:39:06 +0530
From:   Saiyam Doshi <saiyamdoshi.in@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>, Markus.Elfring@web.de
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v2 0/3] Fix issues reported by Coccinelle
Message-ID: <20190922170906.GB5589@SD>
References: <20190917172758.GA11926@SD>
 <76e99512-8818-cec2-9e77-799e4c8481ab@web.de>
 <20190917181423.GB28182@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917181423.GB28182@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 17, 2019 at 08:14:23PM +0200, Wolfram Sang wrote:
> On Tue, Sep 17, 2019 at 08:10:45PM +0200, Markus Elfring wrote:
> > > Using cocciecheck to ensure there are no semantic issues in
> > > i2c-qup driver.
> > 
> > * This wording contains a typo.
> 
> Doesn't matter to me for a cover letter as long as we can understand it.
> 
> > * I would prefer to refer to a desired reduction of a few
> >   source code quality concerns.
> 
> Not needed. I understand what is going on here.

Markus - By "ensure", I mean there are no further cocciecheck issues at this
point in time. And further, what changed is covered in individual patch
changelog. So, I think this information is fine in cover.

> > Can such a prefix be omitted?
Can be, but I like to keep it.

Thanks for review.

-Saiyam
