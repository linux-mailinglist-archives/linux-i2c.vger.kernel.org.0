Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72F0F13A62
	for <lists+linux-i2c@lfdr.de>; Sat,  4 May 2019 15:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbfEDNeQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 May 2019 09:34:16 -0400
Received: from mx2.suse.de ([195.135.220.15]:42360 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726672AbfEDNeQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 4 May 2019 09:34:16 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 57255ACE1;
        Sat,  4 May 2019 13:34:15 +0000 (UTC)
Date:   Sat, 4 May 2019 15:34:13 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Gina Ko <yichunko@google.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: Add i2c block read functionality to i2cget.
Message-ID: <20190504153413.2df06a17@endymion>
In-Reply-To: <CA+=EKe00SL3-eJYg9s-8koJoy_Nk3UFKYSjgRuk9dmRzRc7jgQ@mail.gmail.com>
References: <CA+=EKe00SL3-eJYg9s-8koJoy_Nk3UFKYSjgRuk9dmRzRc7jgQ@mail.gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Gina,

On Fri, 3 May 2019 01:09:19 -0700, Gina Ko wrote:
> I have a patch to add block read functionality. Can you please take a look?

If you need I2C block read, you should be able to use i2cdump already.
Doesn't it work for you?

-- 
Jean Delvare
SUSE L3 Support
