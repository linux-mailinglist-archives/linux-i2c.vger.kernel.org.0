Return-Path: <linux-i2c+bounces-10051-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A093A735D8
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Mar 2025 16:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FC143AE848
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Mar 2025 15:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2074119992D;
	Thu, 27 Mar 2025 15:41:17 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC0F1991BF;
	Thu, 27 Mar 2025 15:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090076; cv=none; b=hRFE2DMGW67GI2E/ZStojx6Pwi3F9/WD53SLeGplHgrQHj/iya/+L/jJQT1MUfcGci25f5MeY8i3x2WPFdl02BXFeynt31wyQvw240JqYN0cLRNcY0kdVICuWPl5EY1p2+wtYs8Y3K4hE4zEr3xcSdw4JeGQYvsebIzSwWGRd4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090076; c=relaxed/simple;
	bh=iDGTBr4HFeWoKFDgObdMSZnfIfDbsKBlYuMVnaygH5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rGgUn+4jEuavh3LT2OU+MPKzD/HmDmVhSf12PA0mt21244OG8bEp5acY/y+NTBSqdOaulwfXbn7BaS62FxTj3WVNBGSg4ogqm2Cc+i36howW0iCYlZ+0xlfsWm4AcaTl4RgXGkcQ5piiqheKiJM6rQsLb/7NrKX82YaBmm67jtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E690C4CEDD;
	Thu, 27 Mar 2025 15:41:15 +0000 (UTC)
Date: Thu, 27 Mar 2025 11:42:03 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>, linux-i2c@vger.kernel.org, Linux
 Trace Kernel <linux-trace-kernel@vger.kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, David Howells
 <dhowells@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [PATCH] i2c: tracing: Remove redundant length field in events
Message-ID: <20250327114203.5b409786@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

From: Steven Rostedt <rostedt@goodmis.org>

The i2c_write and i2c_reply events save the length of the message in the
ring buffer. It also uses __dynamic_array() to save the message itself. As
the length of the __dynamic_array() is saved in the meta data of the array
there's no reason to also save it in the event itself. The length can now
be accessed by __get_dynamic_array_len(). Use that instead.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
[
  NOTE: This removes the "len" field from these events. If that "len" field
  is used by filters or user space tooling, then this will break that. If
  that is the case, then this patch should NOT be accepted.

  I'm only sending it because I noticed the redundancy in the event when
  looking at events that have of "%*p..." in their print formats.
]

 include/trace/events/i2c.h | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/include/trace/events/i2c.h b/include/trace/events/i2c.h
index 142a23c6593c..757f331f3a9c 100644
--- a/include/trace/events/i2c.h
+++ b/include/trace/events/i2c.h
@@ -31,14 +31,12 @@ TRACE_EVENT_FN(i2c_write,
 		       __field(__u16,	msg_nr			)
 		       __field(__u16,	addr			)
 		       __field(__u16,	flags			)
-		       __field(__u16,	len			)
 		       __dynamic_array(__u8, buf, msg->len)	),
 	       TP_fast_assign(
 		       __entry->adapter_nr = adap->nr;
 		       __entry->msg_nr = num;
 		       __entry->addr = msg->addr;
 		       __entry->flags = msg->flags;
-		       __entry->len = msg->len;
 		       memcpy(__get_dynamic_array(buf), msg->buf, msg->len);
 			      ),
 	       TP_printk("i2c-%d #%u a=%03x f=%04x l=%u [%*phD]",
@@ -46,8 +44,8 @@ TRACE_EVENT_FN(i2c_write,
 			 __entry->msg_nr,
 			 __entry->addr,
 			 __entry->flags,
-			 __entry->len,
-			 __entry->len, __get_dynamic_array(buf)
+			 __get_dynamic_array_len(buf),
+			 __get_dynamic_array_len(buf), __get_dynamic_array(buf)
 			 ),
 	       i2c_transfer_trace_reg,
 	       i2c_transfer_trace_unreg);
@@ -95,14 +93,12 @@ TRACE_EVENT_FN(i2c_reply,
 		       __field(__u16,	msg_nr			)
 		       __field(__u16,	addr			)
 		       __field(__u16,	flags			)
-		       __field(__u16,	len			)
 		       __dynamic_array(__u8, buf, msg->len)	),
 	       TP_fast_assign(
 		       __entry->adapter_nr = adap->nr;
 		       __entry->msg_nr = num;
 		       __entry->addr = msg->addr;
 		       __entry->flags = msg->flags;
-		       __entry->len = msg->len;
 		       memcpy(__get_dynamic_array(buf), msg->buf, msg->len);
 			      ),
 	       TP_printk("i2c-%d #%u a=%03x f=%04x l=%u [%*phD]",
@@ -110,8 +106,8 @@ TRACE_EVENT_FN(i2c_reply,
 			 __entry->msg_nr,
 			 __entry->addr,
 			 __entry->flags,
-			 __entry->len,
-			 __entry->len, __get_dynamic_array(buf)
+			 __get_dynamic_array_len(buf),
+			 __get_dynamic_array_len(buf), __get_dynamic_array(buf)
 			 ),
 	       i2c_transfer_trace_reg,
 	       i2c_transfer_trace_unreg);
-- 
2.47.2


