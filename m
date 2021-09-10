Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A57994066A6
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Sep 2021 07:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbhIJFPk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Sep 2021 01:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbhIJFPk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Sep 2021 01:15:40 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABFD0C061575
        for <linux-i2c@vger.kernel.org>; Thu,  9 Sep 2021 22:14:29 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id v20-20020a1cf714000000b002e71f4d2026so339952wmh.1
        for <linux-i2c@vger.kernel.org>; Thu, 09 Sep 2021 22:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=Ze6s6wpN9KzSNecgrpczzQzoITVtf1Ztfs5jirK1uUk=;
        b=cQSJAESg4dmWb4d4ICyt1NWM2thsfbW6vSYv7CcRTbat/7gqpr2/U2+W63DdUG/R7J
         xq6zUSHQ/867i8GMsQT7WT+lDp2Qe6WiYOsuKqHBGiBDIhjI7WTOO4wNjlx0kC1x8dYa
         ygo++2fSBsjPN8D+GCe2Kw1vnlqzvt+x77sLUcNG6OELPyUa8NxpivuVl94Hp+OKMfts
         aUoRN40rzbUVE64qCeG7/6DL8DrusjJzUcSr14TZ6EK6QTZlHK7JXciVmFfeo4IEbNTL
         G/pzhZ/vlVP98i9ENc8PCxpEbYcyGcDV7PKxeNQ06CbgvMRSZw3euZMtbNxiWd4UXuY3
         yAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=Ze6s6wpN9KzSNecgrpczzQzoITVtf1Ztfs5jirK1uUk=;
        b=OGioP/LeIyXzEI8ol3Nens+OqG8j8HfDXj6RGMLi4jbTI2MLnfzV3wnrWD7OSxwOdZ
         YTngK7uEmvIByYu2Zx1jlo5kVg/dYc06HqFlUecI5F9yuDvru8XktzfwbDOJTaYieBvU
         AaSW5qRON5bysS9cdZ+SoB/PvnZr14dsdQlThBskUvI9ADBm09xx7CvGcHS1OLL3Rzq2
         oWF+eQWdp245XJxEjt76i8kOfTVlxwvLQDbNfMMzsJUuGVMpuNhtSQ7sh4XaCaxD1YUx
         5hW+StldbRnzpcQ4KyFLKHeB6t6Skt9K2dYgtbWaSl5zpVzMC3KaGUZtOot8opYU2fsY
         3vsg==
X-Gm-Message-State: AOAM5302USITE2oipF/Mq7xGtuH+SmwJQ49bvZl7r6m+vU+eKqo86O+y
        aLBEa40GQDuMVLJy1H4p4bdBPHhVBIG8IN/rSqM=
X-Google-Smtp-Source: ABdhPJwQzvDzNx0WFozDu7KdnOsj+HDmrOnw+NOYKipYN/e411rnJgnhHYvXiAxzO3vIllEZ2Z6SzyhvWfda/u+t+vY=
X-Received: by 2002:a05:600c:4c17:: with SMTP id d23mr6310889wmp.92.1631250867967;
 Thu, 09 Sep 2021 22:14:27 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sanamohamad906@gmail.com
Sender: christbebe7@gmail.com
Received: by 2002:a1c:f216:0:0:0:0:0 with HTTP; Thu, 9 Sep 2021 22:14:27 -0700 (PDT)
From:   Sana Mohamad <msana6897@gmail.com>
Date:   Fri, 10 Sep 2021 06:14:27 +0100
X-Google-Sender-Auth: vwYDsUpz7MuLfzE5EaUppIcqQ10
Message-ID: <CAMOqPknJR1s1y1H13H8YHwaymw22UTL_GYui4m85fH=tyjq_zw@mail.gmail.com>
Subject: Dear intended recipient
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Greetings,

I know that this mail will come to you as a surprise as we have never
met before, but need not to worry as I am contacting you independently
of my investigation and no one is informed of this communication.
I need your urgent assistance in transferring the sum of
$12,300,000.00 USD immediately to your private account.The money has
been here in our Bank lying dormant for years now without anybody
coming for the claim of it.I want to release the money to you as a
relative to our deceased customer (the account owner) who died along
with his supposed NEXT OF KIN on 16th October 2005.

The Banking laws here do not allow such money to stay more than 15
years, because the money will be recalled to the Bank treasury account
as an unclaimed fund.By indicating your interest I will send you the
full details on how the business will be executed.

Please respond urgently and delete if you are not interested.

Best Regards,
Mr. Sana Mohamad
