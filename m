Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2D04243D61
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Aug 2020 18:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgHMQ3H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Aug 2020 12:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgHMQ3G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Aug 2020 12:29:06 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20445C061757
        for <linux-i2c@vger.kernel.org>; Thu, 13 Aug 2020 09:29:06 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id d6so6845771ejr.5
        for <linux-i2c@vger.kernel.org>; Thu, 13 Aug 2020 09:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
         :user-agent:mime-version;
        bh=S3r0lDCw4aZ8lbwfCN/5/1eV8jZf9bM4JYaVEVxu/w0=;
        b=gpePEsJ5+XjdzFqPh6isAUBFeUfvAgW3MivdiygC4/nouZq/fFLHuaic07padJo8m4
         dsMD8CIi3ZgECKmJfPwAc312c7kE/YljC0HfUPgzmOSXFA4KYialotOqLVp2+PKlQJvU
         2SpQfAek+wFNMs6bC/VBecU0GXshpM74XEm2wBzzscwViyfVsKOwUeG2lOcipRSNt6Be
         Tpc8BXB+dKb8217tkYYst/JwPSLBTW9i3yfOhk3vSh2e7O2bPf8Lz0NLcqwQ61cKUk69
         yjXqfNyD1W0VyBMJIptr9PuJ43nhs3nVHgkwdt0ShOWs4FR3tl1lCmpDiykbbOlVeC+D
         9A/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:references:date
         :in-reply-to:message-id:user-agent:mime-version;
        bh=S3r0lDCw4aZ8lbwfCN/5/1eV8jZf9bM4JYaVEVxu/w0=;
        b=Zpccb9nfd20/vk/HyRpNZYAhoYLV1n4VIpYT01u8o+w1XzgiG7NpdqL+yOVZOZiI5e
         2ask+DD58muRaL6XxqomRzd2uTwD/SgsKDuFQVcLEyMeQSndfoFy1vISs2rMmCigGoY0
         8D41THQNI3JD16knuhgb90hz/IeejvTCZ1ocWC+UEhhSr1WPBgD9nB/9xVZX0SXwTBw7
         8Af8Y5pYl4JRVHYwW0lBFtFoWhupViQWmiDtClOQWPBa1KQXoo3iqxUWt1k5c4JfMDHg
         d0i//oXnUGMbW4p2ZxKU+RzCCbW0VH7py2XNeU5RqO/nEZbsPQ/NBjJFsdGcA4NI2Ate
         SBpQ==
X-Gm-Message-State: AOAM530FGjfrva+FZ7nSrI/tp+hIh7jw33suOg2bU2gRMK38C934RBod
        azzwANeguZQh/1MkmRWNO44=
X-Google-Smtp-Source: ABdhPJwXOtZvllmy+AQYhoRf/IWMRcbPYK7A6k/tDAn75SZNDs69E1jvD6Fo2hmEByblLb4e1Tu2Gw==
X-Received: by 2002:a17:906:d181:: with SMTP id c1mr5410506ejz.181.1597336144785;
        Thu, 13 Aug 2020 09:29:04 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
        by smtp.gmail.com with ESMTPSA id q11sm4284735edn.12.2020.08.13.09.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 09:29:03 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
        (envelope-from <peter@korsgaard.com>)
        id 1k6G6A-0003ae-SX; Thu, 13 Aug 2020 18:29:02 +0200
From:   Peter Korsgaard <peter@korsgaard.com>
To:     Mohammed Billoo <mab@mab-labs.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: ocores: add gaisler to platform data
References: <20200811134426.7613-1-mab@mab-labs.com>
        <87lfii7i18.fsf@dell.be.48ers.dk>
        <CALkjhPpF9wqaZGWQSZ9FphtcXD_obYubFX4te9xtcDdOP4M_gg@mail.gmail.com>
        <CALkjhPrz=0q+sKsB9Y=i4LCCuFVg-bGSzGDyAHaE-XE=qBrVXQ@mail.gmail.com>
Date:   Thu, 13 Aug 2020 18:29:02 +0200
In-Reply-To: <CALkjhPrz=0q+sKsB9Y=i4LCCuFVg-bGSzGDyAHaE-XE=qBrVXQ@mail.gmail.com>
        (Mohammed Billoo's message of "Thu, 13 Aug 2020 10:49:59 -0400")
Message-ID: <87h7t67bn5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>>>>> "Mohammed" == Mohammed Billoo <mab@mab-labs.com> writes:

Hi,

 > And the answer is a patch series (I couldn't figure out the appropriate
 > term to google).

Indeed. Please send a patch series for the needed changes to linux-i2c
and put me in CC.

 > Also, it looks like the linux-i2c mailing list no longer exists?

It does. Perhaps you need to subscribe to be able to post? My earlier
reply did make it to the list:

https://marc.info/?l=linux-i2c&m=159732786421840&w=2


 > On Thu, Aug 13, 2020 at 10:33 AM Mohammed Billoo <mab@mab-labs.com> wrote:

 >> Peter,
 >> 
 >> Thanks for your comment. Would you like me to resubmit the patch with your
 >> suggestions?
 >> 
 >> Also, we'll need to incorporate big/little-endian with the GRLIB accessors
 >> as well (I ran into an issue where a vendor-specific AHB bridge had
 >> endianness conversion, but the IP designer didn't realize that and so I
 >> needed an accessor for both GRLIB and big-endian). I'm not sure what the
 >> best-practice for multiple patches is. Should I submit patch N assuming
 >> patch N-1 was applied?

-- 
Bye, Peter Korsgaard
