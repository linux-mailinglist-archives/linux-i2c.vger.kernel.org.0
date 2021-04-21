Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 508C13673ED
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Apr 2021 22:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245614AbhDUUCR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Apr 2021 16:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244313AbhDUUCQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Apr 2021 16:02:16 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C233C06174A;
        Wed, 21 Apr 2021 13:01:43 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id n2so65251646ejy.7;
        Wed, 21 Apr 2021 13:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
         :user-agent:mime-version;
        bh=MjxD2LQ/s/u2qlGe6v//FAAk9dRNEZGT3/bOF1A/BeE=;
        b=B7oE/HkTTdppN4JdaTTwt1jyGD2x3ii7bBIwTXTOyHnYlBUjb32KZH/nzL8cvqFQWL
         0RD79WHgVB/DMT5OE4StpbZqg/N1XfRMM+c0wTecvNFvBwjnwoh7buljyllNBQu4TMdp
         4HabpI8NVbcwdATsDSga6+FpxCyTVOeW2Muw9Ew04OqWNQ9h5KYap+UDEnxd8JaJOJ+t
         XG7budRgY8TZvuFpiu4NewPzPyG733pRbsSlxNIALqFD+n9wg2NUzqAxUEsQn2sJKpa/
         NLLAt1rGkloWHNQRmKpDucunokzC5DAEx6W/ICLNv3D7gC9Sbd4WA8imM+l6uzbQr1WX
         Gk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:references:date
         :in-reply-to:message-id:user-agent:mime-version;
        bh=MjxD2LQ/s/u2qlGe6v//FAAk9dRNEZGT3/bOF1A/BeE=;
        b=GajcV6i/Sj+IBzou099zmz6etjs48e2CJKe31BtdGGybk6/pkPSd4LGgJgXcEPMhDd
         Y3rnArvI8cZo5lPcb2apphoKavgV6ntoAx5Dma/gelDnO7y3CirJ0+gskH+J9AVgWzFq
         nrrDjNl94R0FHMdZR71jI66rntCeN70PmUSrevQXi7KsabsHEcu68yNG+zF8lcwOQgfg
         kBebB+u3zqyv57SgbPNaqGdh76Lizr9wMHbGmiPsq0pK/j4ZMdVxQFy/V9os3tIcBlfN
         663SH4vyNuzkgdiTKi1YJXWFC8CrHPB9JTSQ8k7jTfUOWujnBl/TzjOtwcASnVRiE67G
         QZQA==
X-Gm-Message-State: AOAM530Mzr7w3uERW2YJe8mqT9l2sIj89a7XnHbab8MzOnwPuycWnRZd
        Ygm6djwqHWplbXshsqvVfcEs/7iAx70=
X-Google-Smtp-Source: ABdhPJyzKhLJykJYtkek2+xNbCilAN0cpLGRC9JLCDV2LAzHmGNjLipojvEjBqneEK4NEE5WCQyOfA==
X-Received: by 2002:a17:907:3e1f:: with SMTP id hp31mr34290984ejc.163.1619035301826;
        Wed, 21 Apr 2021 13:01:41 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
        by smtp.gmail.com with ESMTPSA id u13sm346944ejj.16.2021.04.21.13.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 13:01:40 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
        (envelope-from <peter@korsgaard.com>)
        id 1lZJ2a-0000W1-0x; Wed, 21 Apr 2021 22:01:40 +0200
From:   Peter Korsgaard <peter@korsgaard.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools] Revert "tools: i2ctransfer: add check for returned length from driver"
References: <20210209110556.18814-1-wsa+renesas@sang-engineering.com>
        <20210226174337.63a9c2a6@endymion> <20210310204648.GA332643@ninjato>
        <87tuoe5zfc.fsf@dell.be.48ers.dk> <20210413125433.GA9879@kunai>
Date:   Wed, 21 Apr 2021 22:01:40 +0200
In-Reply-To: <20210413125433.GA9879@kunai> (Wolfram Sang's message of "Tue, 13
        Apr 2021 14:54:33 +0200")
Message-ID: <87tunzv23f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>>>>> "Wolfram" == Wolfram Sang <wsa+renesas@sang-engineering.com> writes:

 >> > I added a section now for the 4.2 release. And (finally!) started
 >> > cleaning up the wiki a little.
 >> 
 >> Thanks! As a packager, I must say that this way of handling bugfixes
 >> isn't great - I only just noticed this now by accident.
 >> 
 >> What is the issue with making bugfix releases?

 > Instead of a minor 4.2.1 we could maybe also simply do a 4.3?

Sure, that is also fine by me.

-- 
Bye, Peter Korsgaard
