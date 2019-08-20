Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A469796021
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2019 15:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729927AbfHTNdV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Aug 2019 09:33:21 -0400
Received: from mx-rz-2.rrze.uni-erlangen.de ([131.188.11.21]:60007 "EHLO
        mx-rz-2.rrze.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728682AbfHTNdV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Aug 2019 09:33:21 -0400
X-Greylist: delayed 590 seconds by postgrey-1.27 at vger.kernel.org; Tue, 20 Aug 2019 09:33:20 EDT
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mx-rz-2.rrze.uni-erlangen.de (Postfix) with ESMTPS id 46CWhK379PzPk9r;
        Tue, 20 Aug 2019 15:23:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2013;
        t=1566307409; bh=BxZImDV6BlbvPHA92gmLrkRnXj5dPxu62gW8SlF7G7o=;
        h=From:Subject:To:Cc:Date:From:To:CC:Subject;
        b=fAvpwIv/WZl+hu8gSJaP+zYQCU1KnTq8XWEnlWsEkloQ1mgSEUbBivjIbJYkRKkRu
         M4GFPD+PfGoF4O0zagcLg0v7ffqP+4MWkrKFW1RlKO/Lja3V5pGhv4w6h2t+QiZk9N
         3dZvZuBEpZJIgZzxSusj1m/rQ3gJ7jNKXWpde+AmKVwt9Qc+zXCb/VWvnlFmCMustY
         RwcCDg9hlzRLR7KA4CMuqYy4N+A9CcPXDQKWaYFEfK6w6eKdMEURwx4cskBANlu4IJ
         zUHfu+rU0qsJosfFOnO5X6XH1oMvLfj03ZdbL0uhsDHhE3pZE/OtAIq7/TymgnRe+B
         I057B2n63Rk/Q==
X-Virus-Scanned: amavisd-new at boeck1.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 109.41.192.99
Received: from [192.168.43.238] (ip-109-41-192-99.web.vodafone.de [109.41.192.99])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: U2FsdGVkX198FXRVDZeSOd/yGZlSwh2MSmzQV7o2K6g=)
        by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 46CWhG6N19zPjvd;
        Tue, 20 Aug 2019 15:23:26 +0200 (CEST)
From:   Sebastian Duda <sebastian.duda@fau.de>
Subject: Status of Subsystems - I2C/SMBUS ISMT DRIVER
To:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        lukas.bulwahn@gmail.com
Message-ID: <97bcaca4-22f8-e17e-55b0-a19443c27bef@fau.de>
Date:   Tue, 20 Aug 2019 15:23:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Seth,
hello Neil,

in my master thesis, I'm using the association of subsystems to 
maintainers/reviewers and its status given in the MAINTAINERS file.
During the research I noticed that there are several subsystems without 
a status in the maintainers file. One of them is the subsystem 
`I2C/SMBUS ISMT DRIVER` where you're mentioned as reviewers.

Is it intended not to mention a status for your subsystems?
What is the current status of your subsystem?

Kind regards
Sebastian Duda
