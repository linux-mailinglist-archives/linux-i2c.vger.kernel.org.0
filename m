Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C868C352AF0
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Apr 2021 15:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234628AbhDBNJs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Apr 2021 09:09:48 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:48029 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbhDBNJr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Apr 2021 09:09:47 -0400
Received: from [192.168.1.155] ([95.118.52.208]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N8nnU-1le53k17OI-015muv; Fri, 02 Apr 2021 15:09:14 +0200
Subject: Re: [PATCH v1 3/7] PCI: New Primary to Sideband (P2SB) bridge support
 library
To:     Henning Schild <henning.schild@siemens.com>,
        Bjorn Helgaas <helgaas@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>, hdegoede@redhat.com
References: <YEZ4IitUa+I9HM5F@smile.fi.intel.com>
 <20210309014221.GA1831206@bjorn-Precision-5520>
 <20210309094252.396b7f2d@md1za8fc.ad001.siemens.net>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <3f33a178-3002-e93e-89f1-8cf05097da25@metux.net>
Date:   Fri, 2 Apr 2021 15:09:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210309094252.396b7f2d@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qZV6mIhgXObuBpZgSvHSXjywNlqq9WbY2cBpn38k0pJsi3MaE5F
 yWBotVtrQZZEYNtw61C35krJaRk0sP16OqempjfG+mHz+0ecg/yCGr9qVSmrnhbqd1zly25
 fqNTaIoRGVaMrz/HLMe1VQaSJC+wd+5fuGvqAO0qy4GmdQJrSz/Hsqp+FQLkEjPnigmuz/g
 kPmErT6S/m130vB4tit7w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NW3GNz6Sf+U=:nXaOc7MCz6gkRbVCQEeuJZ
 e1fDhARtYkTYv5YNmn9V3SKfXGXZ1thv/97ZnkteZf+MkTSN7flnmsqDuHMiq8IswWnAXbi/R
 QdXBOzxFJ7c/KyykzRHsn4Pk/1hZNOT66Ltdcyi3+besb1ZMSn2CPs2MD3krRvdVH/10s8JgQ
 ijCO9l1omcVzbmYIQ/MHivT5JDRPCMblaZ5q4JyCTJi7b5vGw+PivMrqMQU+Bl0ganIVHFzTy
 dvTRc5uD+s4NZJ4D0mpA9e99p98Np3ZFr1PONzoPjTGvIUBNqeio3gtquQ5sMdrWf2J7cCZXo
 2XE34uPP0LsOqkl8Pk8PwJgHgxVwVI9+0uLpAkFJVA+IcSZLVwqnIHwE943z3RocqD7J5LYrC
 xwdxsGZKfQTwVD1Sm/7UC3ikVtkbC6PJgxCMZbpIBIAsFzpE7HzI8Q8kDj1bk27DzY3nxj3W7
 uHQu23Hv/5N5MeK6c088L/dPT3s278QXRbMoZmxEYL7HNYOMPKnM
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09.03.21 09:42, Henning Schild wrote:

> The device will respond to MMIO while being hidden. I am afraid nothing
> stops a collision, except for the assumption that the BIOS is always
> right and PCI devices never get remapped. But just guessing here.

What could go wrong if it is remapped, except that this driver would
write to the wrong mmio space ?

If it's unhidden, pci-core should see it and start the usual probing,
right ?


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
