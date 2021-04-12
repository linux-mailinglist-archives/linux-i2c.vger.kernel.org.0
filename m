Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5A435C5C7
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Apr 2021 13:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240687AbhDLL5P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 07:57:15 -0400
Received: from mail.sch.bme.hu ([152.66.249.140]:25082 "EHLO mail.sch.bme.hu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240622AbhDLL5O (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Apr 2021 07:57:14 -0400
Received: from mail-lf1-f47.google.com (209.85.167.47) by
 Exchange2016-1.sch.bme.hu (152.66.249.140) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.2; Mon, 12 Apr 2021 13:56:55 +0200
Received: by mail-lf1-f47.google.com with SMTP id x13so10783849lfr.2;
        Mon, 12 Apr 2021 04:56:55 -0700 (PDT)
X-Gm-Message-State: AOAM532UEud3TMvdRESMd0e7mc6wuNRdnt6Lua2oCgdbrZ2AyRgn2Huy
        szzlBfXTB4Pu0u1Vqfwd3dKmZsmWqz+IkDn7jbE=
X-Google-Smtp-Source: ABdhPJzsgMVtHC/qdZLmU9vS3FCbAZxt8qW14PudyfBvduxe1m6zO8ygByHAx6ugH6ci4saRoBTSy72geMB63zTb7CQ=
X-Received: by 2002:ac2:5ccd:: with SMTP id f13mr16239768lfq.596.1618228614130;
 Mon, 12 Apr 2021 04:56:54 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>
Date:   Mon, 12 Apr 2021 13:56:42 +0200
X-Gmail-Original-Message-ID: <CACCVKEHwBnP+Q0XtHNJLkWfHN_HG4FYWt8MPW-Qt1SwqihKHng@mail.gmail.com>
Message-ID: <CACCVKEHwBnP+Q0XtHNJLkWfHN_HG4FYWt8MPW-Qt1SwqihKHng@mail.gmail.com>
Subject: Usage of get_random_bytes() in i2c-cp2615
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [209.85.167.47]
X-ClientProxiedBy: Exchange2016-1.sch.bme.hu (152.66.249.140) To
 Exchange2016-1.sch.bme.hu (152.66.249.140)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Normally, `cp2615_i2c_transfer.tag` is a random number that identifies
a given request-reply pair (the chip sends its response with the same
tag it got in the request). Currently, for the sake of ease, my driver
sends its requests with a fixed tag of 0xDD for all requests. This
defeats the purpose of the tag system. Should I use
`get_random_bytes()` instead? My concerns are that generating a random
value for each I2C transfer may lead to the entropy pool being used
up, especially since - if I understand correctly -
`get_random_bytes()` always generates 32 bit random words and discards
any extra bytes if `length%4 != 0`, and I only need 1 byte each time.
