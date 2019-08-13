Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 777128B7A5
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 13:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbfHML4E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 07:56:04 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:34401 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbfHML4E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Aug 2019 07:56:04 -0400
Received: from localhost ([127.0.0.1] helo=flow.W.breakpoint.cc)
        by Galois.linutronix.de with esmtp (Exim 4.80)
        (envelope-from <bigeasy@linutronix.de>)
        id 1hxVPG-0004hy-I0; Tue, 13 Aug 2019 13:56:02 +0200
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>, tglx@linutronix.de
Subject: [PATCH 0/2] Remove IRQF_ONESHOT
Date:   Tue, 13 Aug 2019 13:55:53 +0200
Message-Id: <20190813115555.10542-1-bigeasy@linutronix.de>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Benjamin Rouxel reported a boot failure on RT due to the IRQF_ONESHOT
flag which does not allow IRQ threading.
After looking into the tree I found another driver matching the pattern.
The exynos5 patch was tested by Benjamin, hix5hd2 is only compile
tested.

Sebastian

