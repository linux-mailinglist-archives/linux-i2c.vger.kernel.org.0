Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD42DC982
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2019 17:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393339AbfJRPqQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Oct 2019 11:46:16 -0400
Received: from ms.lwn.net ([45.79.88.28]:36714 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389749AbfJRPqP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 18 Oct 2019 11:46:15 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 365822CA;
        Fri, 18 Oct 2019 15:46:15 +0000 (UTC)
Date:   Fri, 18 Oct 2019 09:46:14 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
Cc:     linux-doc@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: i2c: Fix SPDX-License-Identifier syntax
Message-ID: <20191018094614.5b70ab10@lwn.net>
In-Reply-To: <20191005200126.25809-1-j.neuschaefer@gmx.net>
References: <20191005200126.25809-1-j.neuschaefer@gmx.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat,  5 Oct 2019 22:01:22 +0200
Jonathan Neuschäfer <j.neuschaefer@gmx.net> wrote:

> ReST directives are introduced with two dots.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

I've applied both of these, thanks.

jon
