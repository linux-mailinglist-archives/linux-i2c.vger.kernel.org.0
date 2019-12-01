Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1863810E31D
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Dec 2019 19:29:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727280AbfLAS3i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Dec 2019 13:29:38 -0500
Received: from mtax.cdmx.gob.mx ([187.141.35.197]:14583 "EHLO mtax.cdmx.gob.mx"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726965AbfLAS3i (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 1 Dec 2019 13:29:38 -0500
X-Greylist: delayed 7133 seconds by postgrey-1.27 at vger.kernel.org; Sun, 01 Dec 2019 13:29:37 EST
X-NAI-Header: Modified by McAfee Email Gateway (4500)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cdmx.gob.mx; s=72359050-3965-11E6-920A-0192F7A2F08E;
        t=1575217644; h=DKIM-Filter:X-Virus-Scanned:
         Content-Type:MIME-Version:Content-Transfer-Encoding:
         Content-Description:Subject:To:From:Date:Message-Id:
         X-AnalysisOut:X-AnalysisOut:X-AnalysisOut:
         X-AnalysisOut:X-AnalysisOut:X-SAAS-TrackingID:
         X-NAI-Spam-Flag:X-NAI-Spam-Threshold:X-NAI-Spam-Score:
         X-NAI-Spam-Rules:X-NAI-Spam-Version; bh=M
        8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs4
        8=; b=Hbm8yQ6ie7+WLvrvSJQPJX/EJ1H3wLubU1ScX761gfv8
        hfsE/bqwNoJ38duxZuNrqZQxKiyCtTHL49WDoetHC/2cismrXs
        DbkLMbTR9bGWmSYcmlQ3LJSi8ztyD3o9qK0TM4NByIqlTQo5LU
        3Rk/dz3mo2PmL84LslY67NT6svU=
Received: from cdmx.gob.mx (correo.cdmx.gob.mx [10.250.108.150]) by mtax.cdmx.gob.mx with smtp
        (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-GCM-SHA384)
         id 31cf_38bd_aff16298_93b2_4625_b5c9_38d42796c084;
        Sun, 01 Dec 2019 10:27:23 -0600
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id A79ED1E29B7;
        Sun,  1 Dec 2019 10:18:51 -0600 (CST)
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id oFsxvW8Amtl2; Sun,  1 Dec 2019 10:18:51 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id 4EC451E2FDF;
        Sun,  1 Dec 2019 10:14:19 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.9.2 cdmx.gob.mx 4EC451E2FDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cdmx.gob.mx;
        s=72359050-3965-11E6-920A-0192F7A2F08E; t=1575216859;
        bh=M8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs48=;
        h=Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:
         From:Date:Message-Id;
        b=cQia/in9Dh0rkTtEQWFWVJTmN2zn0C+JiwV+ofPbxwoNe1y6aTMWjay+uIjcCtUNu
         ODZBOKDMqJAHYm91fEnEdNLNGcRX+9oL6JNnraxL7nLd0FfGjM8OBHkJNuu2Vzgb2H
         PPzqdlSy4MV8JOY5Y4bvKFIk6RHYvM7llv49FyrY=
X-Virus-Scanned: amavisd-new at cdmx.gob.mx
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id jE3ucjrO8Pil; Sun,  1 Dec 2019 10:14:19 -0600 (CST)
Received: from [192.168.0.104] (unknown [188.125.168.160])
        by cdmx.gob.mx (Postfix) with ESMTPSA id 1041E1E2E41;
        Sun,  1 Dec 2019 10:05:28 -0600 (CST)
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Congratulations
To:     Recipients <aac-styfe@cdmx.gob.mx>
From:   "Bishop Johnr" <aac-styfe@cdmx.gob.mx>
Date:   Sun, 01 Dec 2019 17:05:21 +0100
Message-Id: <20191201160529.1041E1E2E41@cdmx.gob.mx>
X-AnalysisOut: [v=2.2 cv=HeFkdmM8 c=1 sm=1 tr=0 p=6K-Ig8iNAUou4E5wYCEA:9 p]
X-AnalysisOut: [=zRI05YRXt28A:10 a=T6zFoIZ12MK39YzkfxrL7A==:117 a=9152RP8M]
X-AnalysisOut: [6GQqDhC/mI/QXQ==:17 a=8nJEP1OIZ-IA:10 a=pxVhFHJ0LMsA:10 a=]
X-AnalysisOut: [pGLkceISAAAA:8 a=wPNLvfGTeEIA:10 a=M8O0W8wq6qAA:10 a=Ygvjr]
X-AnalysisOut: [iKHvHXA2FhpO6d-:22]
X-SAAS-TrackingID: 9e9e3ed5.0.23902036.00-2375.40384471.s12p02m002.mxlogic.net
X-NAI-Spam-Flag: NO
X-NAI-Spam-Threshold: 3
X-NAI-Spam-Score: -5000
X-NAI-Spam-Rules: 1 Rules triggered
        WHITELISTED=-5000
X-NAI-Spam-Version: 2.3.0.9418 : core <6686> : inlines <7165> : streams
 <1840193> : uri <2949750>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Money was donated to you by Mr and Mrs Allen and Violet Large, just contact=
 them with this email for more information =


EMail: allenandvioletlargeaward@gmail.com
