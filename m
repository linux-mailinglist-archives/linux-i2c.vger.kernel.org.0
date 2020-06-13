Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFAD81F84F5
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jun 2020 21:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgFMThs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Jun 2020 15:37:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgFMThs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 13 Jun 2020 15:37:48 -0400
X-Greylist: delayed 16184 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 13 Jun 2020 12:37:47 PDT
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0E80C03E96F
        for <linux-i2c@vger.kernel.org>; Sat, 13 Jun 2020 12:37:47 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 49kntd6Q1jz1rsMq;
        Sat, 13 Jun 2020 21:37:45 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 49kntd5zh5z1qqkw;
        Sat, 13 Jun 2020 21:37:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id Pd1JxnBlBplK; Sat, 13 Jun 2020 21:37:45 +0200 (CEST)
X-Auth-Info: Agh4PumfHoO1BwNwWywT9++O7UkTY4N0wPx28Pn9foA=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sat, 13 Jun 2020 21:37:44 +0200 (CEST)
Subject: Re: [PATCH 5/5] i2c: xiic: Only ever transfer single message
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
References: <20200613150751.114595-1-marex@denx.de>
 <20200613150751.114595-5-marex@denx.de> <20200613193333.GA6289@kunai>
From:   Marek Vasut <marex@denx.de>
Message-ID: <b79cdce5-9eff-411b-e2aa-30365a6bbc3d@denx.de>
Date:   Sat, 13 Jun 2020 21:37:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200613193333.GA6289@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/13/20 9:33 PM, Wolfram Sang wrote:
> Hi Marek,

Hi,

> On Sat, Jun 13, 2020 at 05:07:51PM +0200, Marek Vasut wrote:
>> Transferring multiple messages via XIIC suffers from strange interaction
>> between the interrupt status/enable register flags. These flags are being
>> reused in the hardware to indicate different things for read and write
>> transfer, and doing multiple transactions becomes horribly complex. Just
>> send a single transaction and reload the controller with another message
>> once the transaction is done in the interrupt handler thread.
> 
> Do we still get a repeated start between messages of a transfer? Or will
> it be a STOP/START combination?

Repeated start.
