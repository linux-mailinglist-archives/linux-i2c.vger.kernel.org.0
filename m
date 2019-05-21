Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10B0A24A65
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 10:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbfEUIah (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 04:30:37 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35470 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbfEUIah (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 May 2019 04:30:37 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4L8UTgE081198;
        Tue, 21 May 2019 03:30:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558427429;
        bh=anAC+RiLGY1eFGuqe7OQK4ugd+CY1NDoHG/Q9t3xrBk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=PDEwcZNWxzqmsW5ZnXblHDi2VPTOTCWyqoU06TNUBaTBNwKJ8dc2BK6ajueJUkuhh
         UKXCYzYzNM/PXlFmHrkAljwQ/ftbx4+E6nNkQ+IzSzWSJgr8dImstrMXgLdjMdqqoR
         75GKXMRZvmRizio+bJW3GPiYVxN0Yml+bStdptio=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4L8UTVg076446
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 May 2019 03:30:29 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 21
 May 2019 03:30:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 21 May 2019 03:30:29 -0500
Received: from [172.24.190.172] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4L8URLj100261;
        Tue, 21 May 2019 03:30:28 -0500
Subject: Re: [PATCH 2/8] MAINTAINERS: add I2C DT bindings to DaVinci platform
To:     Wolfram Sang <wsa@the-dreams.de>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <linux-i2c@vger.kernel.org>, Kevin Hilman <khilman@kernel.org>
References: <20190521082137.2889-1-wsa@the-dreams.de>
 <20190521082137.2889-3-wsa@the-dreams.de>
From:   Sekhar Nori <nsekhar@ti.com>
Message-ID: <d969bea7-73fc-862b-de3a-1d761adc1ce9@ti.com>
Date:   Tue, 21 May 2019 14:00:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521082137.2889-3-wsa@the-dreams.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21/05/19 1:51 PM, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
> Cc: Sekhar Nori <nsekhar@ti.com>
> Cc: Kevin Hilman <khilman@kernel.org>

Acked-by: Sekhar Nori <nsekhar@ti.com>

Thanks
Sekhar
