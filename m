Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 352B413302E
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 20:58:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728595AbgAGT6H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 14:58:07 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39709 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728379AbgAGT6H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 14:58:07 -0500
Received: by mail-wm1-f66.google.com with SMTP id 20so78002wmj.4;
        Tue, 07 Jan 2020 11:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
         :user-agent:mime-version;
        bh=qWHIdGhD+EJuvy5rVg/Q3JciPO3S68IDp+JUWwtxNmM=;
        b=ISwI41kPCzgOhZigcVVBkpceXXSaPu8gw/c59H5cWPm4RsWfxi/xCuDg2ly2Ri6erz
         j7jG1PE9t2n+wUUa8//feEO6ooyU0B+H1Hgpm+nbTHxpG20eQ0G7gk2AJRu5Wb7PrlBw
         Z3FU+jHY2tp993D5cbQuO2v3Dhqfn0nWzPC0MN8bTLEcHJGBPSvmHZeVoO8izZig5o7R
         2Yvc8vg+7hXVc0lf/2oXVmW95tESkqADJ1dmOndy19Xib1/R6Wadz2fYN4Aw80VZaR8A
         TP3fPOlGtA8FFZzI7eXZrbwP6HlJ2YvL2MZDsl4LgcyyNJ+wuJnoZ5Fg6G9yNU+UFDzo
         TVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:references:date
         :in-reply-to:message-id:user-agent:mime-version;
        bh=qWHIdGhD+EJuvy5rVg/Q3JciPO3S68IDp+JUWwtxNmM=;
        b=cNn2znEXKXyKQQv8WMSEGpDNsJAKxgKfxr+HaP/RMjg91a+YpC9b56/le9oMTUnlIo
         ssxJbkituXHqIZo7e99GYx667nu0pUhz3uMXJ/ic13cjhy6YIJKVc5t+/h3U74p9GAu6
         eZ6MqpkjqyBCoLRJNviB0TFxDPQFVxG8tZQ+20/EO7L+9b5soymN0/cdVxNiBKRlGPdF
         H25VN7jNl9utDQNMHwvDjRwm6v1EvaXbGU/qqxRG8mTRouQWo6pxA20RmyuMEzbkkMhl
         1b6zxCwy85CEvM2ylwD0eUWrDwMVTwfCRXkSR8Fs4JyDWrof1wH2FynyCbqrW7R3PvyR
         i9Vg==
X-Gm-Message-State: APjAAAUpw7Vk9wqZSrY1JthI0DQYd6o3JsJzh9vdKZ3aj2fhgZUpNvX3
        QFAv8i03b1aid/TCVj7i8dI=
X-Google-Smtp-Source: APXvYqzxhBclv4EvKHOkAs2D8bUcFMaBo0tGJ+96epd1UbfU2gqJRvtQFqGiz4YfXD07A1DkOjKsPg==
X-Received: by 2002:a1c:541b:: with SMTP id i27mr56202wmb.137.1578427085197;
        Tue, 07 Jan 2020 11:58:05 -0800 (PST)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
        by smtp.gmail.com with ESMTPSA id r15sm801978wmh.21.2020.01.07.11.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 11:58:04 -0800 (PST)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
        (envelope-from <peter@korsgaard.com>)
        id 1iouzL-0004oj-Kh; Tue, 07 Jan 2020 20:58:03 +0100
From:   Peter Korsgaard <peter@korsgaard.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/12] i2c: ocores: convert to use i2c_new_client_device()
References: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
        <20200107174748.9616-5-wsa+renesas@sang-engineering.com>
        <87muazjewd.fsf@dell.be.48ers.dk> <20200107193125.GA10117@ninjato>
Date:   Tue, 07 Jan 2020 20:58:03 +0100
In-Reply-To: <20200107193125.GA10117@ninjato> (Wolfram Sang's message of "Tue,
        7 Jan 2020 20:31:25 +0100")
Message-ID: <87imlnjayc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>>>>> "Wolfram" == Wolfram Sang <wsa@the-dreams.de> writes:

 > Hi Peter,
 > a happy new year to you!

thanks, You too!

 >> > Move away from the deprecated API and return the shiny new ERRPTR where
 >> > useful.
 >> 
 >> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
 >> 
 >> I didn't follow the discussion, but I don't see any returns anywhere?

 > Yeah, an ERRPTR is not "useful" here. However, the old API is going to
 > be removed, so your driver is converted, too.

Ok, great.

Reviewed-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
