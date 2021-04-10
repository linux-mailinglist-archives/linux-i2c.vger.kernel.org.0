Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4BA835ABD9
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Apr 2021 10:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234076AbhDJIRL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Apr 2021 04:17:11 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:26245 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234045AbhDJIRL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Apr 2021 04:17:11 -0400
Received: from belgarion ([90.11.64.244])
        by mwinf5d03 with ME
        id qwGj240055GBUJa03wGlRY; Sat, 10 Apr 2021 10:16:56 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Sat, 10 Apr 2021 10:16:56 +0200
X-ME-IP: 90.11.64.244
From:   Robert Jarzmik <robert.jarzmik@free.fr>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Cameron <jic23@cam.ac.uk>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH 04/12] ARM: pxa: stargate2: Constify the software node
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
        <20210329105047.51033-5-heikki.krogerus@linux.intel.com>
        <20210406193917.GC3122@kunai>
X-URL:  http://belgarath.falguerolles.org/
Date:   Sat, 10 Apr 2021 10:16:42 +0200
In-Reply-To: <20210406193917.GC3122@kunai> (Wolfram Sang's message of "Tue, 6
        Apr 2021 21:39:17 +0200")
Message-ID: <87eefituz9.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wolfram Sang <wsa@kernel.org> writes:

> On Mon, Mar 29, 2021 at 01:50:39PM +0300, Heikki Krogerus wrote:
>> Additional device properties are always just a part of a
>> software fwnode. If the device properties are constant, the
>> software node can also be constant.
>> 
>> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> Cc: Jonathan Cameron <jic23@cam.ac.uk>
>> Cc: Daniel Mack <daniel@zonque.org>
>> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
>> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
>
> I like to apply it soon. Can we get an ack, please?
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

-- 
Robert
